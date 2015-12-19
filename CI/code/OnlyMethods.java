    /**
     * Notifies all ServletContextListeners at their contextDestroyed
     * method.
     *
     * @return <code>true</code> if the event was processed successfully,
     * <code>false</code> otherwise.
     */
    private boolean contextListenerStop() {

        boolean ok = true;

        if (contextListeners.isEmpty()) {
            return ok;
        }

        ServletContextEvent event = new ServletContextEvent(
            getServletContext());
        int len = contextListeners.size();
        for (int i = 0; i < len; i++) {
            // Invoke in reverse order of declaration
            ServletContextListener listener =
                contextListeners.get((len - 1) - i);
            if (listener instanceof RestrictedServletContextListener) {
                listener = ((RestrictedServletContextListener) listener).
                    getNestedListener();
                context.setRestricted(true);
            }
            try {
                fireContainerEvent(ContainerEvent.BEFORE_CONTEXT_DESTROYED,
                                   listener);
                listener.contextDestroyed(event);
                fireContainerEvent(ContainerEvent.AFTER_CONTEXT_DESTROYED,
                                   listener);
            } catch (Throwable t) {
                context.setRestricted(false);
                fireContainerEvent(ContainerEvent.AFTER_CONTEXT_DESTROYED,
                                   listener);
                String msg = MessageFormat.format(rb.getString(LISTENER_STOP_EXCEPTION),
                                                  listener.getClass().getName());
                getServletContext().log(msg, t);
                ok = false;
            }
        }

        contextListeners.clear();

        return ok;
    }
    
    private boolean eventListenerStop() {
        if (eventListeners.isEmpty()) {
            return true;
        }

        Iterator<EventListener> iter = eventListeners.iterator();
        while (iter.hasNext()) {
            EventListener listener = iter.next();
            // ServletContextListeners and HttpSessionListeners
            // already had their PreDestroy called
            if (listener instanceof ServletContextListener ||
                    listener instanceof HttpSessionListener) {
                continue;
            }
            fireContainerEvent(ContainerEvent.PRE_DESTROY, listener);
        }

        eventListeners.clear();

        return true;
    }
    
     /**
     * Merge the context initialization parameters specified in the application
     * deployment descriptor with the application parameters described in the
     * server configuration, respecting the <code>override</code> property of
     * the application parameters appropriately.
     */
    private void mergeParameters() {
        Map<String,String> mergedParams = new HashMap<>();

        for (String name : findParameters()) {
            mergedParams.put(name, findParameter(name));
        }

        for (ApplicationParameter param : findApplicationParameters()) {
            if (param.getOverride()) {
                if (mergedParams.get(param.getName()) == null)
                    mergedParams.put(param.getName(), param.getValue());
            } else {
                mergedParams.put(param.getName(), param.getValue());
            }
        }

        ServletContext sc = getServletContext();
        for (Map.Entry<String,String> entry : mergedParams.entrySet()) {
            sc.setInitParameter(entry.getKey(), entry.getValue());
        }
    }
    
    /**
     * Allocate resources, including proxy.
     * Return <code>true</code> if initialization was successfull,
     * or <code>false</code> otherwise.
     */
    public boolean resourcesStart() {

        boolean ok = true;

        Hashtable<String, String> env = new Hashtable<String, String>();
        if(getParent() != null) {
            env.put(ProxyDirContext.HOST, getParent().getName());
        }
        env.put(ProxyDirContext.CONTEXT, getName());
        try {
            ProxyDirContext proxyDirContext = new ProxyDirContext(env, webappResources);
            if(webappResources instanceof BaseDirContext) {
                ((BaseDirContext)webappResources).setDocBase(getBasePath(getDocBase()));
                ((BaseDirContext)webappResources).allocate();
            }
            this.resources = proxyDirContext;
        } catch(Throwable t) {
            if(log.isLoggable(Level.FINE)) {
                String msg = MessageFormat.format(rb.getString(STARTING_RESOURCES_EXCEPTION), getName());
                log.log(Level.SEVERE, msg, t);
            } else {
                log.log(Level.SEVERE, STARTING_RESOURCE_EXCEPTION_MESSAGE,
                        new Object[] {getName(), t.getMessage()});
            }
            ok = false;
        }

        return ok;
    }
    
    /**
     * Starts this context's alternate doc base resources.
     */
    public void alternateResourcesStart() throws LifecycleException {

        if (alternateDocBases == null || alternateDocBases.isEmpty()) {
            return;
        }

        Hashtable<String, String> env = new Hashtable<String, String>();
        if (getParent() != null) {
            env.put(ProxyDirContext.HOST, getParent().getName());
        }
        env.put(ProxyDirContext.CONTEXT, getName());
        for(AlternateDocBase alternateDocBase : alternateDocBases) {
            String basePath = alternateDocBase.getBasePath();
            DirContext alternateWebappResources = ContextsAdapterUtility.unwrap(
                    alternateDocBase.getWebappResources());
            try {
                ProxyDirContext proxyDirContext = new ProxyDirContext(env, alternateWebappResources);
                if(alternateWebappResources instanceof BaseDirContext) {
                    ((BaseDirContext)alternateWebappResources).setDocBase(basePath);
                    ((BaseDirContext)alternateWebappResources).allocate();
                }
                alternateDocBase.setResources(ContextsAdapterUtility.wrap(proxyDirContext));
            } catch(Throwable t) {
                if(log.isLoggable(Level.FINE)) {
                    String msg = MessageFormat.format(rb.getString(STARTING_RESOURCES_EXCEPTION), getName());
                    throw new LifecycleException(msg, t);
                } else {
                    String msg = MessageFormat.format(rb.getString(STARTING_RESOURCE_EXCEPTION_MESSAGE),
                                                      new Object[] {getName(), t.getMessage()});
                    throw new LifecycleException(msg);
                }
            }
        }
    }
    
    /**
     * Deallocate resources and destroy proxy.
     */
    public boolean resourcesStop() {

        boolean ok = true;

        try {
            if (resources != null) {
                if (resources instanceof Lifecycle) {
                    ((Lifecycle) resources).stop();
                }
                if (webappResources instanceof BaseDirContext) {
                    ((BaseDirContext) webappResources).release();
                }
            }
        } catch (Throwable t) {
            log.log(Level.SEVERE, STOPPING_RESOURCES_EXCEPTION, t);
            ok = false;
        }

        this.resources = null;

        return (ok);

    }
    
    /**
     * Stops this context's alternate doc base resources.
     */
    public boolean alternateResourcesStop() {

        boolean ok = true;

        if (alternateDocBases == null || alternateDocBases.isEmpty()) {
            return ok;
        }
        for(AlternateDocBase alternateDocBase : alternateDocBases) {
            final DirContext alternateResources = ContextsAdapterUtility.unwrap(
                    alternateDocBase.getResources());
            if(alternateResources instanceof Lifecycle) {
                try {
                    ((Lifecycle)alternateResources).stop();
                } catch(Throwable t) {
                    log.log(Level.SEVERE, STOPPING_RESOURCES_EXCEPTION, t);
                    ok = false;
                }
            }
            final DirContext alternateWebappResources = ContextsAdapterUtility.unwrap(
                alternateDocBase.getWebappResources());
            if(alternateWebappResources instanceof BaseDirContext) {
                try {
                    ((BaseDirContext)alternateWebappResources).release();
                } catch(Throwable t) {
                    log.log(Level.SEVERE, STOPPING_RESOURCES_EXCEPTION, t);
                    ok = false;
                }
            }
        }

        this.alternateDocBases = null;

        return (ok);
    }
    
     /**
     * Load and initialize all servlets marked "load on startup" in the
     * web application deployment descriptor.
     *
     * @param children Array of wrappers for all currently defined
     *  servlets (including those not declared load on startup)
     */
    /* SJSAS 6377790
    public void loadOnStartup(Container children[]){
    */
    // START SJSAS 6377790
    public void loadOnStartup(Container children[]) throws LifecycleException {
    // END SJSAS 6377790
        // Collect "load on startup" servlets that need to be initialized
        Map<Integer, List<Wrapper>> map =
            new TreeMap<Integer, List<Wrapper>>();
        for (Container aChildren : children) {
            Wrapper wrapper = (Wrapper)aChildren;
            int loadOnStartup = wrapper.getLoadOnStartup();
            if(loadOnStartup < 0) {
                continue;
            }
            Integer key = loadOnStartup;
            List<Wrapper> list = map.get(key);
            if(list == null) {
                list = new ArrayList<Wrapper>();
                map.put(key, list);
            }
            list.add(wrapper);
        }

        // Load the collected "load on startup" servlets
        for (List<Wrapper> list : map.values()) {
            for(Wrapper wrapper : list) {
                try {
                    wrapper.load();
                } catch(ServletException e) {
                    String msg = MessageFormat.format(rb.getString(SERVLET_LOAD_EXCEPTION), getName());
                    getServletContext().log(msg, StandardWrapper.getRootCause(e));
                    // NOTE: load errors (including a servlet that throws
                    // UnavailableException from the init() method) are NOT
                    // fatal to application startup
                    // START SJSAS 6377790
                    throw new LifecycleException(
                        StandardWrapper.getRootCause(e));
                    // END SJSAS 6377790
                }
            }
        }
    }
