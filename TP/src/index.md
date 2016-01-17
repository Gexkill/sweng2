#Test Plan

![Politecnico di Milano](../resources/logo_polimi.png?raw=true)

**Version 1.0**

**Relasese date : 21/01/2016**

* Claudio Cardinale (mat. 849760)
* Gilles Dejaegere (mat. 853950)
* Massimo Dragano (mat. 775392)

[//]: # (pagebreak)

#Contents
1. [Introduction](#introduction)
    1. [Revision history](#revision-history)
    1. [Purpose and Scope](#purpose-and-scope)
    1. [List of Definitions and abbreviations](#list-of-definitions-and-abbreviations)
    1. [List of Reference Documents](#list-of-reference-documents)
1. [Integration Strategy](#integration-strategy)
    1. [Entry Criteria](#entry-criteria)
    1. [Elements to be Integrated](#elements-to-be-integrated)
    1. [Integration Testing Strategy](#integration-testing-strategy)
    1. [Sequence of Component/function Integration](#sequence-of-componentfunction-integration)
        1. [Software Integration Sequence](#software-integration-sequence)
        1. [Subsystem Integration Sequence](#subsystem-integration-sequence)
1. [Individual Steps and Test Description](#individual-steps-and-test-description)
1. [Tools and Test Equipment Required](#tools-and-test-equipment-required)
1. [Program Stubs and Test Data Required](#program-stubs-and-test-data-required)
1. [Used tools](#used-tools)
1. [Hours of work](#hours-of-work)
    1. [Claudio Cardinale](#claudio-cardinale)
    1. [Gilles Dejaegere](#gilles-dejaegere)
    1. [Massimo Dragano](#massimo-dragano)


[//]: # (pagebreak)

# 1. Introduction
## 1.1. Revision history


| **Date** | **Version** | **Description** | **Authors** |
|----------|-------------|-----------------|-------------|
|20/01/2016|    1        | Original Version| Claudio Cardinale, Gilles Dejaegere and Massimo Dragano       |   
|          |             |                 |             |   
|          |             |                 |             |   


## 1.2. Purpose and Scope

The purpose of this document is to present to the testing team the sequence of tests to be applied to the different components (and their interfaces) forming the application. These components were of course designed during the design phase of the project development and are presented in the Design Document. These test are aimed at verify weither the components behave and cooperate correctly. This is done by testing the different components throught their interfaces. The tests explained in this document will have to be done in the correct order. The document also specifies for each test the eventual testing tools to be used as well as the eventuel additional stubs or mockups to use.

## 1.3. List of Definitions and abbreviations

* RASD: Requirements Analysis and Specifications Document
* DD: Design Document
* ITPD: Integration Test Plan Document
* Stub: **to be done**
* Mocks: **to be done**
* Bottom-up : Bottom-up is an strategy of information processing. It is used in many different fields such as software or scientific theories. Regarding integration testing the bottom-up strategy consists in the integration of low level modules first and the integration of higher level modules after. 
* Top-down : Top-down is an strategy of information processing. Regarding integration testing the top-down strategy consists in the integration of high level modules first and the integration of low level modules after. It is the opposite of bottom-up. 
* Big-bang : Big-bang is an non-incremental integration strategy where all the components are integrated at once, right after they are all unit-tested. 


## 1.4. List of Reference Documents
* The MyTaxiService project description : "Project Description And Rules.pdf"
* The Assignment document: "Assignment 4 - integration test plan"
* The MyTaxiService RASD
* The MyTaxiService DD
* The exemple document given : "Integration Test Plan"

[//]: # (pagebreak)

# 2. Integration Strategy

## 2.1. Entry Criteria

The following model classes must be unit tested before our integration tests.

  - `Reservation`
  - `Ride`
  - `Driver`
  - `Request`
  - `Zone`

we should test all non-trivial methods. for instance:


  - `Ride#close`: mark a ride as terminated
  - **TODO**

getter and setter methods can be skipped.

## 2.2. Elements to be Integrated

#### QueueManager

###### addRequest

Throws an exception if there is no `Zone` containing the `Request` starting position.

Add a `Request` to the starting `Zone` requests queue.

###### removeRequest

Remove a `Request` from a `Zone` requests queue if present.

###### addDriver

Throws an exception if there is no `Zone` containing the `Driver` position.
Throws an exception if the `Driver` is already enqueued ( even if `Zone` is different ).

Add a `Driver` to it's `Zone` drivers queue.

###### removeDriver

Remove a `Driver` from the `Zone` drivers queue if present.

###### peekDriverForZone

Thows an exception if there is no `Driver` in the `Zone` drivers queue.

return the first enqueued driver for a specified `Zone`

#### RequestConstroller

###### create

Throws an exception if invalid arguments has been provided.

return a new `Request`.

#### DriverController

###### login

Throws an exception if credentials are wrong.

On success it return some driver informations that can be used
by the clients to build their `Driver` proxy.

###### setAvailable

Throws an exception if a `Ride` is in progress.

It changes the `Driver` availability and put it in the correct `Zone`
when changing to `true`, using `QueueManager#addDriver`.

###### setPosition

Throws an exception if there is no `Zone` containing the specified position.

It set the `Driver` position to the given argument.
It also closes the `Ride` if:

  - there is an associated `Ride`
  - the driver position matches the arrive one.

#### RideController

###### create

Throws an exception if the client is not allowed to perform this action.
Throws an exception if the given arguments are invalid.

Create a new `Ride` from a pending `Request`.
Retrun the new `Ride`.

> NOTE: allowed clients are `Driver`s in the drivers queue of the `Zone` of the request.

## 2.3. Integration Testing Strategy

The sequence of integrations that will have to be applied on the components of this project mainly follows a bottom-up approach. This approach has many adventages : there is no need for stubs, the errors are more easily located (compared to strategies like the big-bang strategy) and, if the conception of the components also follows a bottom-up approach, the testing of lower level modules can take place simultaneously to the conception of higher level modules. Unfortunatly, this strategy also has its drawbacks : the integration needs drivers to be done, and even worse, the high level components are tested last, which means that conception mistakes will be spotted later. However we still think that the adventages of the bottom-up strategies are more impacting that its drawbacks.
In some cases such as for exemple inter-dependencies between two components, the use of a pure bottom-up approach will not be possible, and then a mixt of top down and bottom-up strategies will be used.

## 2.4. Sequence of Component/function Integration
### 2.4.1. Software Integration Sequence

### 2.4.2. Subsystem Integration Sequence
The MyTaxiService application designed is divided in different sub-systems. From the "High level components" figure (see DD pg 8) we can identify 4 subsystems :
* The central,
* The driver,
* The client,
* The database.
Furthermore, the central can be devided in two sub-systems : the model and the controler (DD pg 8, Figure 5 : Component view).
 
The driver subsystem, the client subsystem and the database subsystem are atomic subsystems and are therefore not discussed in the section 2.4.1. In opposition, the controler and the model are composed of different subcomponents these subcomponents have to be integrated together. Concernig the order of integration of the subsystems, the model will be integrated to the controller at first. This will take place even before the subcomponents of the controller are all integrated together (see section 2.4.1**: the controller[to adapt]**). This is done because there are to many controller subcomponents interacting with the model. Once this integration is done, the database will be integrated, then the driver and finally the client. This can be seen on the following figure.

![Subsystems integration][subsystems]

| **ID** | **Integration Tests** |**Sections**|
|--------|-----------------------|------------|
|S1|Model --> Controler = Central|            |
|S2|Database --> Central         |            |
|S3|Driver --> Central           |            |
|S4|Client --> Central           |            |
**Sections will have to be added once defined in section 3. If you guys know how to to nice arrows instead of "-->" please show me ;)**

[//]: # (pagebreak)

# 3. Individual Steps and Test Description

# 4. Tools and Test Equipment Required
Arquilan + jUnit


# 5. Program Stubs and Test Data Required

# 6. Used tools
* Github: for version controller
* Gedit and ReText: to write MarkDown with spell check
* Dia: to make figures 

[//]: # (pagebreak)

# 7. Hours of work
## Claudio Cardinale


## Gilles Dejaegere


## Massimo Dragano


[subsystems]:../resources/section4.2_Subsystem_Integration.png?raw=true
