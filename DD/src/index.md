#Design document

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
1. [Architectural design](#architectural-design)
    1. [Overview](#overview)
    1. [High level components and their interaction](#high-level-components-and-their-interaction)
    1. [Component view](#component-view)
    1. [Deploying view](#deploying-view)
    1. [Runtime view](#runtime-view)
    1. [Component interfaces](#component-interfaces)
    1. [Selected architectural styles and patterns](#selected-architectural-styles-and-patterns)
    	1. [MVC](#mvc)
    1. [Other design decisions](#other-design-decisions)
1. [Algorithm design](#algorithm-design)
1. [User interface design](#user-interface-design)
1. [Requirements traceability](#requirements-traceability)
1. [References](#references)
1. [Hours of work](#hours-of-work)
    1. [Claudio Cardinale](#claudio-cardinale)
    1. [Gilles Dejaegere](#gilles-dejaegere)
    1. [Massimo Dragano](#massimo-dragano)


[//]: # (pagebreak)


# Introduction
   
## Purpose

The purpose of this document is give more technical details than RASD about MyTaxiService system.  
This document is address to developers. In fact we want to identify:

* High level architecture
* Design patternes
* Main components with our interfaces with each other

**COMPLETE**

## Scope
We will project and implement myTaxiService, which is a service based on mobile application and web application, with two different targets of people:

* taxi drivers
* clients

The system allows clients to reserve a taxi via mobile or web app, using GPS position to identify client's zone (but the client can insert it manually) and find taxi in the same zone.  
On the other side the mobile app allows taxi drivers to accept or reject a ride request and to communicate automatically their position (so the zone).  
The clients are not registered since the company wants a quick system so if there is a registration a lot of clients won't use the app. So the clients must insert their name and phone number each time (this is faster than creating an account and logging each time).

The system includes extra services and functionalities such as taxi sharing.

The main purpose of the system is to be more efficient and reliable than the existing one in order to decrease costs of the taxi management and offer a better service to the clients. **KEEP OR REMOVE?**

We will design:
* Critical internal components
* Interface with external services like SMS gateway
* Interface with the old system

**COMPLETE**

## Definitions, acronyms, abbreviations

* RASD: Requirements analysis and specifications document
* DD: design document


**INSERT OTHER GLOSSARY FROM RASD**

## Reference documents
* RASD produced before **Write version number**
* Specification Document: Assignments 1 and 2 (RASD and DD).pdf
* Structure of the design document.pdf

## Document structure
* introduction: in this section we introducing the design document, saying why we do it and which parts are covered from it that are not covered by RASD

**COMPLETE**

[//]: # (pagebreak)

# Architectural design
## Overview
## High level components and their interaction
## Component view
## Deploying view
## Runtime view
## Component interfaces
## Selected architectural styles and patterns

### MVC


## Other design decisions


[//]: # (pagebreak)

# Algorithm design

[//]: # (pagebreak)

# User interface design

[//]: # (pagebreak)

# Requirements traceability

[//]: # (pagebreak)

# References

[//]: # (pagebreak)

# Hours of work
## Claudio Cardinale



## Gilles Dejaegere


## Massimo Dragano



