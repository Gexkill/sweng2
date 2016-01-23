#Project Plan

![Politecnico di Milano](../resources/logo_polimi.png?raw=true)

**Version 1.0**

**Release date : 02/02/2016**

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
1. [Estimate size, effort and cost](#estimate-size-effort-and-cost)
    1. [Function points](#function-points)
    1. [COCOMO](#cocomo)
1. [Tasks](#tasks)
1. [Allocate resources](#allocate-resources)
1. [Risks](#risks)
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
|02/02/2016|    1        | Original Version| C. Cardinale, G. Dejaegere and M. Dragano       |   
|          |             |                 |             |   
|          |             |                 |             |   


## 1.2. Purpose and Scope


## 1.3. List of Definitions and abbreviations
* Function Points estimation : the function point estimation is an estimation of the size of an specific software in terms of line of codes.

## 1.4. List of Reference Documents  

[//]: # (pagebreak)

# 2. Estimate size, effort and cost
## 2.1. Function points

Function Points estimation : the function point estimation is an estimation of the size of an specific software to be based on its functional requirements. The count of function points of the software is language and technology independant. The size in terms of lines of codes of this software can be calculated using the following formula : 

> LOC = FP * AVC 

where :
* LOC = lines of code
* FP = total estimated function points of the software
* AVC = language specific constant varying from 2-40 for a fourth generation programming language.

Function points are classified under different types. For each type, a different weight is also assigned for each function point according if the concerned function is estimated as being simple, complex, or average. For the estimation of the size of our MyTaxiService application, we will uses the weights indicated in the table here under. These numbers are taken from the slides "Cost Estimation" provided by the professor Damian Andrew Tamburri.

| **function type**      | **Low** | **Average** | **High** |
|------------------------|---------|-------------|----------|
|Internal Logic Files    |   7     |   10        |  15      |   
|External Interface Files|   5     |   7         |  10      |   
|External Inputs         |   3     |   4         |  6       |   
|External Outputs        |   4     |   5         |  7       |
|External Inquiries      |   3     |   4         |  6       |

### 2.1.1 Internal Logic Files

The different ILFs that will be used by our systems can be deduced from the class diagram representing the `model` of our application that is located in the RASD and is shown here under. 

![Model taken from the RASD][model]

For each component, its complexity and the associated function points are listed in the table here under : 

| **ILF**      | **Complexity = Function Points** |
|--------------|----------------------------------|
|Zone                    |   High = 15     |
|Driver and Taxi         |   High = 15     |
|Request                 |   Average = 10  | 
|Ride                    |   High = 15     |
|StopPositions and Client|   Low = 7       | 
|Position                |   Low = 7       |
|**Total**               |   69            |

Since each Driver has exactly one taxi, and each stop position has exactly one client, these entities are managed and stored togethter for more simplicity.

### 2.1.2 External Interface Files

The application does not have to manage date furnished and maintained by external services.

### 2.1.3 External Inputs

The application interacts both with drivers and with clients, each having their own set of possible interactions.

Concerning the driver, the system has to enable him to:

* login
* change availability : this operation consists in changing the availability of the driver object. If the driver becomes available, the driver object has to be put at the end of the appropriate waiting queue. In the other case, when the driver is not available anymore, he has to be withdrawed from the appropriate waiting queue. The appropriate waiting queue is found using the position of the driver. This operation is evaluated as complex.
* change position : this operation takes place when the driver changes of zone. If the driver concerned has his status "available", he has to be withdrawed from the queue of his previous zone and add to the queue of the new zone. This operation is complex.
* accept request : when the driver receive a request via the push notification service, his has to answer. Positive answer are handeled by the RideController (for the creation of the ride) and transmitted to the QueueManager (to prevent him asking the next driver). Negative answers are handeled by the RequestController that transmits it to the QueueManager so that he can ask the next taxi driver and put the former at the end of the queue.

Concerning the client, the system has to enable him to:

* require ride : this request requires to find a taxi driver avaible and ask him if he accepts the ride. The managing of the answer of the taxi driver and the mananging of the queue of taxi as already been taken into account for the taxi driver and this functionality is therefore judged as of an average complexity.
* reserve a ride : the reservations are preproccessed by a scheduler (to be trigered on the appropriate time) and are then managed as requests. The additionnal complexity of the reservation is estimated as low.
* share the ride : Shared request or reservations must be pre-processed, aiming to merge then in shared requests. This is an complex operation.

| **EI**      | **Complexity = Function Points** |
|--------------|---------------------------------|
|login                    |   Low = 3       |
|change availability      |   High = 6      |
|change position          |   High = 6      | 
|accept request           |   High = 6      |
|require ride             |   Average = 4   |
|reserve ride             |   Low = 3       | 
|share the ride           |   Low = 3       |
|**Total**                |    31           |

### 2.1.4 External Outputs

### 2.1.5 External Inquiries

| **EIF**      | **Complexity = Function Points** |
|--------------|----------------------------------|
|SMSGateway                   |   Low = 5     |
|PushGateway                  |   Low = 5     |
|Total                        |      10       |

## 2.2. COCOMO

[//]: # (pagebreak)

# 3. Tasks

[//]: # (pagebreak)

# 4. Allocate resources

[//]: # (pagebreak)

# 5. Risks

[//]: # (pagebreak)

# 6. Used tools
* Github: for version controller
* Gedit and ReText: to write MarkDown with spell check

[//]: # (pagebreak)

# 7. Hours of work
## Claudio Cardinale


## Gilles Dejaegere


## Massimo Dragano


[subsystems]:../resources/subsystem_integration.png?raw=true
[controllers]:../resources/controllers_integration.png?raw=true
