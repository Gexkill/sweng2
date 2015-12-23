#Code inspection

![Politecnico di Milano](../resources/logo_polimi.png?raw=true)

**Version 1.0**

* Claudio Cardinale (mat. 849760)
* Gilles Dejaegere (mat. 853950)
* Massimo Dragano (mat. 775392)

[//]: # (pagebreak)

#Contents
1. [Introduction](#introduction)
    1. [Purpose](#purpose)
    1. [Scope](#scope)
    1. [Definitions, acronyms, abbreviations](#definitions-acronyms-abbreviations)
    1. [Reference documents](#reference-documents)
    1. [Document structure](#document-structure)
1. [Classes](#classes)
    1. [StandardContext](#standardcontext)
        1. [Methods](#methods)
1. [Functional role](#functional-role)
1. [Issues list found by applying the checklist](#issues-list-found-by-applying-the-checklist)
1. [Other problems](#other-problems)
1. [Used tools](#used-tools)
1. [Hours of work](#hours-of-work)
    1. [Claudio Cardinale](#claudio-cardinale)
    1. [Gilles Dejaegere](#gilles-dejaegere)
    1. [Massimo Dragano](#massimo-dragano)


[//]: # (pagebreak)

#Introduction
## Purpose

The purpose of this document is to give the problems found during the inspection of a small amount of code of a specific version of glashfish.  
Each group of the project has different methods assigned of a specif version of glashfish. We have to analyze them making all check of a checklist and finding other problems, then we have to report problems found in this document.

**WRITE MORE**

## Scope
Glashfish is the official implementation of JEE. It is an open source project that uses svn as version system, in fact we used it to retrieve a specif version of glashfish: 64219 (of 16 Oct 2015 05:11).  
This version is required by the assignment text since we have some methods of this version assigned to us to check.  
Glashfish is a maven project, in fact we imported the pom file into intellij IDEA and we used it and sonar to test some check of the checklist. **KEEP OR REMOVE?**

**WRITE MORE**


## Definitions, acronyms, abbreviations

* JEE: Java enterprise edition
* SVN: apache subversion, it is a version controller system, the successor of CVS
* CVS: Concurrent versions system, the first version controller system
**WRITE acronyms find in the code**

## Reference documents
* Assignment document: Code inspection.pdf
* Glashfish javadoc of this version: [http://glassfish.pompel.me/](http://glassfish.pompel.me/)
* Methods assigned to each group: [http://assignment.pompel.me/](http://assignment.pompel.me/)

## Document structure
* **Introduction:** this section introduces the inspection document. It contains a justification of his utility and indications on which parts are covered in this document.
* **Classes:** this section describes the classes and the methods assigned
* **Functional role:** this section describes the functional role of the class of the methods assigned. **TODO write role of each method?**
* **Issues list found by applying the checklist:** this section describes the issues found applying the checklist given.
* **Other problems:** this section describes other problems found that are not strictly related to the checklist.



[//]: # (pagebreak)


#Classes

All methods assigned to us belong to the same class.

## StandardContext
**Namespace:** org.apache.catalina.core  
**Extends:** ContainerBase  
**Implements:** Context, ServletContext

### Methods
    Name:
        contextListenerStop( )
    Start Line:
        5457
    Name:
        eventListenerStop( )
    Start Line:
        5509
    Name:
        mergeParameters( )
    Start Line:
        5537
    Name:
        resourcesStart( )
    Start Line:
        5564
    Name:
        alternateResourcesStart( )
    Start Line:
        5597
    Name:
        resourcesStop( )
    Start Line:
        5635
    Name:
        alternateResourcesStop( )
    Start Line:
        5662
    Name:
        loadOnStartup( Container children [ ] )
    Start Line:
        5708

**WRITE IN A BETTER WAY?**


[//]: # (pagebreak)


#Functional role

This class is the standard implementation of the *Context* interface.
According to the javadoc it is:

>  A **Context** is a Container that represents a servlet context, and therefore an individual web application, in the Catalina servlet engine. It is therefore useful in almost every deployment of Catalina (even if a Connector attached to a web server (such as Apache) uses the web server's facilities to identify the appropriate Wrapper to handle this request. It also provides a convenient mechanism to use Interceptors that see every request processed by this particular web application.   
> The parent Container attached to a Context is generally a Host, but may be some other implementation, or may be omitted if it is not necessary.  
> The child containers attached to a Context are generally implementations of Wrapper (representing individual servlet definitions).

![inheritance diagram][inheritanceDiagram]

**TODO class diagram automatically generated?**
**TODO write also our interpretation?**
**TODO write role of each method?**
**TODO remember that the class implements ServletContext that is compiled and extends ContianerBase**

[//]: # (pagebreak)


#Issues list found by applying the checklist

**TODO write task lists ??**

[//]: # (pagebreak)


#Other problems


[//]: # (pagebreak)


#Used tools
* intellij IDEA: JAVA EE IDE
* sonar: useful tools to analyze code from style point of view

[//]: # (pagebreak)

# Hours of work
## Claudio Cardinale


## Gilles Dejaegere


## Massimo Dragano


[inheritanceDiagram]: ../resources/inheritance_diagram.png?raw=true
