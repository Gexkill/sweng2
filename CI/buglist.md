eventListenerStop: while can be replaced with foreach.
alternateResourcesStart: unnecessary array for vararg ( 5625 )
loadOnStartup: parameter "children" declared in C-style array ( 5708 )
contextListenerStop: it's more readable to use an iterator or to build a new list and reverse it.

#### following polimi checklist inspection

  - from class `RestrictedServletContextListener`
    - method `contextInitialized` should start with a verb ( hint: `onContextInitialized` )
    - method `contextDestroyed` should start with a verb ( hint: `onContextDestroyed` )
  - method `backgroundProcess` should start with a verb ( hint: `runBackgroundProcess` )
  - field `count` is not meaningful ( hint: `backgroundProcessCounter` )
  - method `contextListenerStart` should start with a verb ( hint: `notifyContextStarted` )
  - method `contextListenerStop` should start with a verb ( hint: `stopContextListening` )
  - return value of method `contextListenerStop` is never used ( hint: change to `void` )
  - method `create` is not clear and it looks like a simple alias of the `init` method
  - method `create` is not used ( hint: delete it )
  - method `engineBase` should start with a verb ( hint: `getEngineBase` )
  - method `eventListenerStop` should start with a verb ( hint: `stopEventListening` )
  - method `eventListenerStop` always return true ( hint: change to `void` )
  - method `filterStart` should start with a verb ( hint: `startFilters` )
  - method `filterStop` should start with a verb ( hint: `stopFilters` )
  - method `managerStart` should start with a verb ( hint: `startManager` )
  - method `managerStop` should start with a verb ( hint: `stopManager` )
  - method `resourcesStart` should start with a verb ( hint: `allocateResources` )
  - method `resourcesStop` should start with a verb ( hint: `freeResources` )
  - method `restrictedSetPipeline` should start with a verb ( hint: `setPipeline` )
  - method `restrictedSetPipeline` should be made accessible only to certain packages ( hint: declare it as `protected` and give a `friendly` accessor from the child class )
  - method `sessionCreatedEvent` should start with a verb ( hint: `onSessionCreatedEvent` )
  - method `sessionDestroyedEvent` should start with a verb ( hint: `onSessionDestroyedEvent` )
  - method `sessionRejectedEvent` should start with a verb ( hint: `onSessionRejectedEvent` )
  - method `sessionExpiredEvent` should start with a verb ( hint: `onSessionExpiredEvent` )
  - method `sessionPersistedStartEvent` should start with a verb ( hint: `onSessionPersistedStartEvent` )
  - method `sessionPersistedEndEvent` should start with a verb ( hint: `onSessionPersistedEndEvent` )
  - method `sessionActivatedStartEvent` should start with a verb ( hint: `onSessionActivatedStartEvent` )
  - method `sessionActivatedEndEvent` should start with a verb ( hint: `onSessionActivatedEndEvent` )
  - method `sessionPassivatedStartEvent` should start with a verb ( hint: `onSessionPassivatedStartEvent` )
  - method `sessionPassivatedEndEvent` should start with a verb ( hint: `onSessionPassivatedEndEvent` )
  - method `sessionListenerStop` shlould start with a verb ( hint: `stopSessionListening` )
  
  
