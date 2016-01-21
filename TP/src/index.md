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
    1. [Integration test case I1](#integration-test-case-i1)
    1. [Integration test case I2](#integration-test-case-i2)
    1. [Integration test case I3](#integration-test-case-i3)
    1. [Integration test case I4](#integration-test-case-i4)
    1. [Integration test case I5](#integration-test-case-i5)
    1. [Integration test case I6](#integration-test-case-i6)
    1. [Integration test case I7](#integration-test-case-i7)
    1. [Integration test case I8](#integration-test-case-i8)
1. [Tools and Test Equipment Required](#tools-and-test-equipment-required)
    1. [Automatic tests](#automatic-tests)
    1. [Manual tests](#manual-tests)
    1. [Performance tests](#performance-tests)
1. [Program Stubs and Test Data Required](#program-stubs-and-test-data-required)
    1. [Stubs](#stubs)
        1. [SMS gateway](#sms-gateway)
        1. [ClientDriver](#clientdriver)
    1. [Data for tests](#data-for-tests)
    1. [Critical data tests](#critical-data-tests)
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
|20/01/2016|    1        | Original Version| C. Cardinale, G. Dejaegere and M. Dragano       |   
|          |             |                 |             |   
|          |             |                 |             |   


## 1.2. Purpose and Scope

The purpose of this document is to present to the testing team the sequence of tests to be applied to the different components (and their interfaces) forming the application. These components were of course designed during the design phase of the project development and are presented in the Design Document. These test are aimed at verify weither the components behave and cooperate correctly. This is done by testing the different components throught their interfaces. The tests explained in this document will have to be done in the correct order. The document also specifies for each test the eventual testing tools to be used as well as the eventuel additional stubs or mockups to use.

## 1.3. List of Definitions and abbreviations

* RASD: Requirements Analysis and Specifications Document
* DD: Design Document
* ITPD: Integration Test Plan Document
* Stub: some code that emulate other functionalities or data, eventually using fake data.
* Drivers: drivers are like stubs with the difference that they are not used to be called by the component actually tested, but are use to call themselfs specific functions of the component actually tested.
* Mocks: stubs with the possibility of verifying wheter or not a specific method of this mock has been called a specific number of times. Mocks are therefore slightly more complex stubs.
* Unit test: the most famous way to perform tests via assertions
* Bottom-up : Bottom-up is an strategy of information processing. It is used in many different fields such as software or scientific theories. Regarding integration testing the bottom-up strategy consists in the integration of low level modules first and the integration of higher level modules after. 
* Top-down : Top-down is an strategy of information processing. Regarding integration testing the top-down strategy consists in the integration of high level modules first and the integration of low level modules after. It is the opposite of bottom-up. 
* Big-bang : Big-bang is an non-incremental integration strategy where all the components are integrated at once, right after they are all unit-tested. 
* jMeter: java GUI program to measure the performance of a web server, it is developed by apache
* apache: open source software company
* laravel: is an php MVC framework
* php: is a programming language designed for the web
* SMS: short message service, it is the most famous way to send text messages to a mobile phone.
* push notification: the modern way to send complex messages to a smartphone


## 1.4. List of Reference Documents  
* The MyTaxiService project description : "Project Description And Rules.pdf"
* The Assignment document: "Assignment 4 - integration test plan"
* The MyTaxiService RASD
* The MyTaxiService DD
* The example document given: "Integration Test Plan"
* Laravel testing: [https://laravel.com/docs/5.1/testing](https://laravel.com/docs/5.1/testing)

[//]: # (pagebreak)

# 2. Integration Strategy

## 2.1. Entry Criteria

The following model classes must be unit tested before our integration tests.

  - `Reservation`
  - `Ride`
  - `Driver`
  - `Request`
  - `Zone`
  - `SchedulerHelper`
  - `QueueManager`

we should test all non-trivial methods. for instance:

  - `Ride#close`: mark a ride as terminated
  - `SchedulerHelper#addReservation`: manage `Reservation` scheduling correctly
  - `QueueManager#addRequest`: manage `Request`s according to specifications

getter and setter methods can be skipped.

## 2.2. Elements to be Integrated

**[Gilles : I think it is very good works :) I would just have one suggestion. I think since we descripe the integration strategy lower, maybe we should put your work in section 3 and here we should just put again our component vieux (modified) from the DD and say that these are the components to be integrated. Maybe you already planned to do this, I'm not sure. Do not hesitate to ask me if you want me to put the component vieux here and make some blabla ;) ]**

**Gilles: this table should be in the "2.4.1.2 The controllers" since it shows the integration sequence**


|**ID**|**Integration Test**|**Paragraphs**|
|------|--------------------|--------------|
|I1    |NotificationHelper -> SMSGateway | ?? ?? ?? |
|I2    |QueueManager -> Model | ?? ?? ?? |
|I3    |QueueManager -> NotificationHelper | ?? ?? ?? |
|I4    |DriverController -> Model | ?? ?? ?? |
|I5    |RequestController -> Model & QueueManager | ?? ?? ?? |
|I6    |SchedulerHelper -> RequestController | ?? ?? ?? |
|I7    |ReservationController -> SchedulerHelper | ?? ?? ?? |
|I8    |RideController -> Model & QueueManager & NotificationHelper | ?? ?? ?? |
|I9    |Router -> RideController & RequestController & RideController & DriverController | ?? ?? ?? |

**[claudio: fix on pdf]**

## 2.3. Integration Testing Strategy

The sequence of integrations that will have to be applied on the components of this project mainly follows a bottom-up approach. This approach has many advantages : there is no need for stubs, the errors are more easily located (compared to strategies like the big-bang strategy) and, if the conception of the components also follows a bottom-up approach, the testing of lower level modules can take place simultaneously to the conception of higher level modules. Unfortunately, this strategy also has its drawbacks : the integration needs drivers to be done, and even worse, the high level components are tested last, which means that conception mistakes will be spotted later. However we still think that the advantages of the bottom-up strategies are more impacting that its drawbacks.
In some cases such as for example inter-dependencies between two components, the use of a pure bottom-up approach will not be possible, and then a mix of top down and bottom-up strategies will be used.

**[claudio: we are using stubs (take a look at the section 5.1 introduction)]**

## 2.4. Sequence of Component/function Integration
### 2.4.1. Software Integration Sequence
#### 2.4.1.1 The Model
**To be done**

#### 2.4.1.2 The Controllers

![Controller integration sequence][controllers]

**This diagramms shows that first the notification help is integrated to the sms gateway, then the queue is integrated to (smsgateway+notificationhelper) ... etc**
**To be discussed, aproved, and then further develloped**

### 2.4.2. Subsystem Integration Sequence
The MyTaxiService application designed is divided in different sub-systems. From the "High level components" figure (see DD pg 8) we can identify 4 subsystems :

* The central,
* The driver,
* The client,
* The database.
Furthermore, the central can be devided in two sub-systems : the model and the controler (DD pg 8, Figure 5 : Component view).
 
The driver subsystem, the client subsystem and the database subsystem are atomic subsystems and are therefore not discussed in the section 2.4.1. In opposition, the controler and the model are composed of different subcomponents these subcomponents have to be integrated together. Concernig the order of integration of the subsystems, the model will be integrated to the controller at first. This will take place even before the subcomponents of the controller are all integrated together (see section 2.4.1**: the controller[to adapt]**). This is done because there are to many controller subcomponents interacting with the model. Once this integration is done, the database will be integrated, then the driver and finally the client. This can be seen on the following figure.

![Subsystems integration][subsystems]

[//]: # (pagebreak)


| **ID** | **Integration Tests** | **Sections** |
|--------|-----------------------|--------------|
|S1|Model -> Controler = Central|              |
|S2|Database -> Central         |              |
|S3|Driver -> Central           |              |
|S4|Client -> Central           |              |

**Sections will have to be added once defined in section 3. If you guys know how to to nice arrows instead of "-->" please show me ;)**


[//]: # (pagebreak)


# 3. Individual Steps and Test Description


## 3.1. Integration test case I1

  - **Test Case ID**: I1T1
  - **Test Item(s)**: `NotificationHelper` -> `SMSGateway`
  - **Input specification**: `Ride`, `Client`
  - **Output specification**: A notification it's sent as an SMS to the `SMSGateway`
  - **Purpose**: Verify `NotificationHelper` and `SMSGateway` interaction
    - notify about a new `Ride` to the `Client`
  - **Dependencies**: `SMSGateway` stub

## 3.2. Integration test case I2

  - **Test Case ID**: I2T1
  - **Test Item(s)**: `QueueManager` -> `Zone`
  - **Input specification**: `Request` and `Zone`
  - **Output specification**: `Zone` is managed in the correct way.
  - **Purpose**: Verify `QueueManager` and `Zone` interaction
    - add `Request`s to the correct `Zone`
    - remove `Request`s from the correct `Zone`
  - **Dependencies**: N/A

## 3.3. Integration test case I3
  
  - **Test Case ID**: I3T1
  - **Test Item(s)**: `QueueManager` -> `NotificationHelper`
  - **Input specification**: `Request` and `Driver`
  - **Output specification**: A notifications are sent to the `Driver`
  - **Purpose**: Verify `QueueManager` and `NotificationHelper` interaction
    - notify about a new `Request` to the first available `Driver`
  - **Dependencies**: N/A

## 3.4. Integration test case I4

  - **Test Case ID**: I4T1
  - **Test Item(s)**: `DriverController` -> `Model`
  - **Input specification**: `Driver`, `Ride`
  - **Output specification**: `Driver` and `Ride` are managed in the correct way.
  - **Purpose**: Verify `DriverController` and `Model` interaction
    - set `Driver` position
    - close a `Ride` when `Driver` reach the arrive
    - set `Driver` availability
    - get a `Driver` from it's authenticaton credentials
  - **Dependencies**: `ClientDriver`

## 3.5. Integration test case I5

  - **Test Case ID**: I5T1
  - **Test Item(s)**: `RequestController` -> `QueueManager`
  - **Input specification**: `Request`
  - **Output specification**: `Request` are sent to `QueueManager`
  - **Purpose**: Verify `RequestController` and `QueueManager` interaction
    - enqueue a created `Request`
  - **Dependencies**: `ClientDriver`

## 3.6. Integration test case I6

  - **Test Case ID**: I6T1
  - **Test Item(s)**: `SchedulerHelper` -> `RequestController`
  - **Input specification**: `Reservation`
  - **Output specification**: `SchedulerHelper` built `Request`s are sent to the `RequestController`
  - **Purpose**: Verify `SchedulerHelper` and `RequestController` interaction
    - send `Request`s to the `RequestController` when fired
  - **Dependencies**: N/A

## 3.7. Integration test case I7

  - **Test Case ID**: I7T1
  - **Test Item(s)**: `ReservationController` -> `SchedulerHelper`, `Model`
  - **Input specification**: `Reservation`
  - **Output specification**: `Reservation`s are sent to the `SchedulerHelper`
  - **Purpose**: Verify `ReservationController` behaviour
    - create a `Reservation`
    - delete a `Reservation`
    - notify new `Reservation`s to the `SchedulerHelper`
    - notify deleted `Reservation`s to the `SchedulerHelper`
  - **Dependencies**: `ClientDriver`

## 3.8. Integration test case I8

  - **Test Case ID**: I8T1
  - **Test Item(s)**: `RideController` -> `Model`
  - **Input specification**: `Ride`
  - **Output specification**: `Ride`s are managed as expected
  - **Purpose**: Verify `RideController` and `Model` interaction
    - create a `Ride`
    - delete created `Ride`'s parent `Request`
  - **Dependencies**: `ClientDriver`
  
---

  - **Test Case ID**: I8T2
  - **Test Item(s)**: `RideController` -> `QueueManager`
  - **Input specification**: `Ride`
  - **Output specification**: parent `Request` are pulled out from queue
  - **Purpose**: Verify `RideController` and `QueueManager` interaction
    - remove created `Ride` parent `Request` from queue
  - **Dependencies**: `ClientDriver`
  
---

  - **Test Case ID**: I8T3
  - **Test Item(s)**: `RideController` -> `NotificationHelper`
  - **Input specification**: `Ride`
  - **Output specification**: send `Notification`s as expected
  - **Purpose**: Verify `RideController` and `NotificationHelper` intercation
    - send a `Notification` to the `Client` when it's `Request` is accepted
  - **Dependencies**: `ClientDriver`


**[Claudio: test sharing option?]**

[//]: # (pagebreak)

# 4. Tools and Test Equipment Required
**Note:** Since we said in the previous documents that we use laravel application (MVC php framework), we will use the laravel tests that extend PHPUnit tests. They are the same as Arquilan + jUnit (tests for JEE explained during the lessons) but for php + laravel.

We will create fake data to test application. Fake data are used to populate the models and to have something to test.

## 4.1. Automatic tests
Since we want to test the entire application via integration tests, if it respects the requirements we decided to use laravel tests:

* **Laravel tests**: it is an extension to PHPUnit tests that add additional assertion and allow to emulate the entire client-server application. In fact you're able to test if a web page return the right body or the right HTTP status code, that is very useful in a pure restful application.
* **PHPUnit**: it is the standard php implementation of unit tests.
* **Unit test**: it is the most famous way to perform tests. In each test you have to make at least one assertion where you assert that two value are same, if it is false the test fails

So we create laravel tests like the following:     
```php
public function testApplication()
{
    $response = $this->call('POST', '/user', ['name' => 'Taylor']);

    $this->assertEquals(200, $response->status());
    $this->seeJson(['data' => 'data'])
}
```

## 4.2. Manual tests
We will test the entire system in a manual way to test:

* If the mobile/web applications are easy to use (user experience).
* If the localization of GPS works properly.

**Note:** we will use the devices and systems defined on [RASD section 1.6.2](https://github.com/sweng2/sweng2/blob/master/RASD/src/index.md#hardware-limitations)

## 4.3 Performance tests
We test the performance of the system like a blackbox, we test only the external API. In fact testing these we test all critical parts (in terms of performance). To do that obviously we need a lot of fake data on the server to simulate a critical situation.

We try to perform a huge amount of simultaneous requests and we measure the time needed to complete all requests (with static data like average, standard deviation and so on).

We decided to use *jMeter* that a powerful java program to do that (it is made by apache), but we can use also other tools like *ab* (another apache tool for server benchmark) that is very useful in some cases since it is a command line program. 

**Insert every word in glosary**

[//]: # (pagebreak)


# 5. Program Stubs and Test Data Required

## 5.1 Stubs
We have only 2 stubs since we decided to use top-down

### 5.1.1. SMS gateway
#### Usages
* I1T1 

#### Description
This stub allows to test the SMS functionalities, emulating the external gateway this for two reasons:

* Cost: reduce the cost of tests (don't send real SMS)
* Easy to test: in this way it is easy test functionality, in fact there are no network problems (the *send* return always OK) and the stub offers easy method to see the text of messages sent

### 5.1.2. ClientDriver
#### Usages
* I4T1
* I5T1
* I7T1
* I8T1
* I8T2
* I8T3

#### Description
This stub allows to the driver application to emulate different things:

* it emulates the mobile application as a restful client that perform requests, this is done via laravel tests
* it emulates the push notification service gateway needed to send push notification to a specific mobile device, this stub allows to emulates it in the same way of emulation of SMS gwateway. So there are no network problems and it's easy assert via tests the text of notification sent.

## 5.2 Data for tests
We will insert fake data for taxis, clients, requests and other entities to populate the database. To generate them we will use the faker library and the seed function included with laravel, that allow us to populate easily database with fake data.

## 5.3 Critical data tests
We will add critical data tests like:

* All requests in the same zone
* All taxis in the same zone
* No data of a specif category (no taxis, no clients, ...)

[//]: # (pagebreak)

# 6. Used tools
* Github: for version controller
* Gedit and ReText: to write MarkDown with spell check
* Dia: to make figures 

[//]: # (pagebreak)

# 7. Hours of work
## Claudio Cardinale


## Gilles Dejaegere


## Massimo Dragano


[subsystems]:../resources/subsystem_integration.png?raw=true
[controllers]:../resources/controllers_integration.png?raw=true
