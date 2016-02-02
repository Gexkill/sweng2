#Project Plan

![Politecnico di Milano](../resources/logo_polimi.png?raw=true)

**Version 1.0**

**Release date: 02/02/2016**

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
        1. [Internal Logic Files](#internal-logic-files)
        1. [External Interface Files](#external-interface-files)
        1. [External Inputs](#external-inputs)
        1. [External Outputs](#external-outputs)
        1. [External Inquiries](#external-inquiries)
    1. [COCOMO](#cocomo)
        1. [Introduction to COCOMO](#introduction-to-cocomo)
        1. [Scale driver](#scale-driver)
        1. [Cost driver](#cost-driver)
        1. [Effort, duration and size of the team](#effort-duration-and-size-of-the-team)
        1. [Detailed report](#detailed-report)
1. [Tasks](#tasks)
1. [Allocate resources](#allocate-resources)
1. [Risks](#risks)
    1. [Project risks](#project-risks)
    1. [Technical risks](#technical-risks)
    1. [Business risks](#business-risks)
    1. [Risks probability and severity](#risks-probability-and-severity)
    1. [Contingency plan](#contingency-plan)
    1. [Montecarlo analysis](#montecarlo-analysis)
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

The aim of this document is to plan the work of the myTaxyService project.
Planning is an hard task that is critical for the project life.
An unrealistic estimation can lead the project to failure.
A Project plan contains an estimation of the costs and efforts required to reach the project goals.
Beside it studies how to organize the work in tasks and which resources should be allocated to them.
Last but not least there is a risk analysis, which is a proactive approach to risks that can alter the work.

## 1.3. List of Definitions and abbreviations
* Function Points estimation: the function point estimation is an estimation of the size of a specific software in terms of line of codes.
* SLOC: Source Lines Of Code; it measures the lines of code of a project (empty and commented lines excluded)
* FP: A function point is a *unit of measurement* to express the amount of business functionality an information system provides to a user.
* Gannt diagram: a type of bar chart illustrating a project schedule.
* Montecarlo analysis: a statistical method that performs several iterations of some things to test the behavior in the feasible worst cases.
* Standard deviation: a measure used to quantify the amount of variation or dispersion of a set of data values.
* CFU/ECTS: university credits that give a measurement of the effort needed for a course.

## 1.4. List of Reference Documents  
* The MyTaxiService project description: "Project Description And Rules.pdf"
* The Assignment document: "Assignment 5 - Project"
* The MyTaxiService RASD
* The MyTaxiService DD
* The MyTaxiService TP
* The example documents given:
    * Example of usage of FP and COCOMO for Assignment 5
    * Second example of usage of FP and COCOMO for Assignment 5



[//]: # (pagebreak)

# 2. Estimate size, effort and cost
## 2.1. Function points

Function Points estimation: the function point estimation is an estimation of the size of a specific software to be based on its functional requirements. The count of function points of the software is language and technology independent. The size in terms of lines of codes of this software can be calculated using the following formula: 

$$LOC = FP \cdot AVC $$

where:

* LOC = lines of code
* FP = total estimated function points of the software
* AVC = language specific constant varying from 2-40 for a fourth generation programming language.

Function points are classified under different types. For each type, a different weight is also assigned for each function point according if the concerned function is estimated as being simple, complex, or average. For the estimation of the size of our MyTaxiService application, we will use the weights indicated in the table here under. These numbers are taken from the slides "Cost Estimation" provided by the professor Damian Andrew Tamburri.

| **function type**      | **Low** | **Average** | **High** |
|------------------------|---------|-------------|----------|
|Internal Logic Files    |   7     |   10        |  15      |   
|External Interface Files|   5     |   7         |  10      |   
|External Inputs         |   3     |   4         |  6       |   
|External Outputs        |   4     |   5         |  7       |
|External Inquiries      |   3     |   4         |  6       |

### 2.1.1 Internal Logic Files

The different ILFs that will be used by our system can be deduced from the class diagram representing the `model` of our application that is located in the RASD and shown here under. 

![Model taken from the RASD][model]

For each component, its complexity and the associated function points are listed in the table here under: 

| **ILF**                | **Complexity** | **Function Points** |
|------------------------|----------------|---------------------|
|Zone                    |   High         |                15   |
|Driver and Taxi         |   High         |                15   |
|Request                 |   Average      |                10   | 
|Ride                    |   High         |                15   |
|StopPositions and Client|   Low          |                 7   | 
|Position                |   Low          |                 7   |
|**Total**               |                |                69   |

Since each Driver has exactly one taxi, and each stop position has exactly one client, these entities are managed and stored together for more simplicity.

### 2.1.2 External Interface Files

The application does not have to manage date furnished and maintained by external services.

[//]: # (pagebreak)

### 2.1.3 External Inputs

The application interacts both with drivers and with clients, each one having their own set of possible interactions.

Concerning the driver, the system has to enable him to:

* login/logout
* change availability: this operation consists in changing the availability of the driver object. If the driver becomes available, the driver object has to be put at the end of the appropriate waiting queue. In the other case, when the driver is not available anymore, he has to be withdrew from the appropriate waiting queue. The appropriate waiting queue is found using the position of the driver. This operation is evaluated as complex.
* change position: this operation takes place when the driver changes of zone. If the driver concerned has his status "available", he has to be withdrew from the queue of his previous zone and added to the queue of the new zone. This operation is complex.
* accept request: when the driver receives a request via the push notification service, he has to answer. Positive answers are handled by the RideController (for the creation of the ride) and transmitted to the QueueManager (to prevent him asking the next driver). Negative answers are handled by the RequestController that transmits it to the QueueManager so that he can ask the next taxi driver and put the former at the end of the queue.

Concerning the client, the system has to enable him to:

* require ride: this request requires to find a taxi driver available and ask him if he accepts the ride. The managing of the answer of the taxi driver and the managing of the queue of taxi has already been taken into account for the taxi driver and this functionality is therefore judged as of an average complexity.
* reserve a ride: the reservations are preprocessed by a scheduler (to be triggered on the appropriate time) and are then managed as requests. The additional complexity of the reservation is estimated as low.
* share the ride: shared requests or reservations must be preprocessed, aiming to merge them in shared requests. This is a complex operation.

| **EI**       | **Complexity** | **Function Points** |
|--------------|----------------|-----------------|
|login                          |   Low | 3       |
|logout                         |   Low | 3       |
|change availability            |   High | 6      |
|change position                |   High | 6      | 
|answer request                 |   High | 6      |
|require ride                   |   Average | 4   |
|reserve ride                   |   Low | 3       | 
|share the ride                 |   Low | 3       |
|**Total**                      |  | 34           |

### 2.1.4 External Outputs

Our application must send information to the clients and the drivers. 
Ride information: the system has to inform the client about the incoming taxi and the estimated arrival time. In addition, if the client has requested for a shared ride, the system has also to inform him about the estimated cost of his ride. The estimation of the cost of the ride is a complex operation since it depends on the length of the client's itinerary, but also on the itineraries of the other clients sharing the ride (in order to know the proportion of the first clients itinerary that is actually shared and with how many other clients). 
request information: the system has to notify the appropriate driver with the information concerning the appropriate request. These notifications are sent using an external gateway which add some complexities to the sending of information. The sending of the request information to the taxi driver is therefore evaluated as having an average difficulty.

| **EO**       | **Complexity** | **Function Points** |
|--------------|----------------|------------------|
|ride information                |   High | 7     |
|request information             |   Average | 6  |
|**Total**                       |      | 13      |

### 2.1.5 External Inquiries

There is only one type of external inquiry that must be managed by our system and it consists in showing to the taxi driver his position in the queue when the taxi driver requires it. This operation is estimated as complex since it has to retrieve this information by scanning the appropriate queue of drivers.

| **EI**      | **Complexity** | **Function Points** |
|-------------|----------------|-----------------|
|driver position                 |  High | 6     |
|**Total**                       |      | 6      |

### 2.2 Cumulated Function Points and code size estimation

Now that the amount of function points for each function type of our application has been estimated, we can easily dress a table summarizing the situation: 

| **Function Type**      | **Function Points** |
|------------------------|---------------------|
|Internal Logic Files    |   69                |
|External Interface Files|   0                 |
|External Inputs         |   34                |
|External Outputs        |   13                |
|External Inquiries      |   6                 |
|**Total**               |   122               |

As we can see, there is a huge disparity between the values of each function type. Nearly 60% of the function points are associated to the internal logic, about 25% to the external input, and only slightly more than 15% is associated to the external output/inquiries. This can be explained by the purpose of the application. Indeed, MyTaxiService is an application aimed at managing taxi drivers waiting queue and helping users order a taxi-ride (which requires again accessing and modifying these waiting queues). On the other hand, the difference between the internal logic and the external inputs seems overestimated. This might be due to the fact that the weight in function points of the internal logic files is more than twice than the one of the weight of the external inputs (cfr. section 2.1).   




## 2.2. COCOMO

### 2.2.1. Introduction to COCOMO

To proceed with the calculation of SLOC we have to convert the FP obtained with the formula given in section 2.1. To do that we need a conversation factor (AVC), we have found the following site that gives some conversion factors for some languages: [http://www.qsm.com/resources/function-point-languages-table](http://www.qsm.com/resources/function-point-languages-table) but there is not php with laravel, so we considered the factor of J2EE that is analogous with php + laravel since they are both two MVC web application framework and object languages. So the factor that we will use is **46**.

This leads to an amount of line of codes equals to:

$$LOC = FP \cdot AVC = 122 \cdot 46 = 5612$$

To perform the estimation of the effort needed to produce these line of codes, and therefore, our application, we will use the parameters of the official table [http://csse.usc.edu/csse/research/COCOMOII/cocomo2000.0/CII_modelman2000.0.pdf](http://csse.usc.edu/csse/research/COCOMOII/cocomo2000.0/CII_modelman2000.0.pdf)

### 2.2.2. Scale driver

In the following figure (found in the official documentation) we can see the values of the different scale drivers associated with different rating levels. 

**Copy table from officialfile**

The different values chosen for our application can be seen in the table here under. 

| **Scale Driver**      | **rating level** |  **value** |
|-----------------------|------------------|------------|
|Precedentedness        |   Nomimal        |    3.72    |
|Development Flexibility|   High           |    2.03    |
|Risk Resolution        |   Nominal        |    4.24    |
|Team Cohesion          |   Very High      |    2.19    |
|Process maturity       |   High           |    3.12    |
|**Total**              |                  |    15.3    |

### 2.2.3. Cost driver

The different values chosen for our application can be seen in the table here under.

| **Cost Drivers**      | **rating level** |  **value** |
|-----------------------|------------------|------------|
|Required Software Reliability          | Low      |    0.92    |
|Data Base Size                         | High     |    1.14    |
|Product Complexity                     | High     |    1.17    |
|Developed for Reusability              | Low      |    0.95    |
|Documentation Match to Life-Cycle Needs| Nominal  |    1       |
|Execution Time Constraint              | Nominal  |    1       |
|Main Storage Constraint                | Nominal  |    1       |
|Platform Volatility                    | Low      |    0.87    |
|Analyst Capability                     | Nominal  |    1       |
|Programmer Capability                  | Nominal  |    1       |
|Personnel Continuity                   | Very High|    0.81    |
|Applications Experience                | High     |    0.88    |
|Platform Experience                    | Nominal  |    1       |
|Language and Tool Experience           | High     |    0.9     |
|Use of Software Tools                  | Nominal  |    1       |
|Multisite Development                  | Nominal  |    1       |
|Required Development Schedule          | Nominal  |    1       |
|**Total**              |               |  0.65    |


### 2.2.4. Effort, duration and size of the team

The COCOMO II approach gives an equation for calculating the effort:

$$Effort = 2.94 \cdot EAF \cdot (KSLOC)^E$$

Where:

* Effort = estimated total number of Person-months needed
* EAF = product of the cost drivers, in our case EAF equals 0.65
* KSLOC = number of thousands of lines of codes estimated to be needed for our application. KSLOC has been approximated to 5.382
* E = Exponent derived from the scale drivers. E equals 0.91+(sum of the scale drivers)/100, in our case: 1.063

Using the parameters specific to the MyTaxiService application we arrive to an estimation of:

$$Effort = 2.94 \cdot 0.65 \cdot 5.612^{1.063} = 11.95 PM$$

To estimate the duration of the development of the application, another formula is given by the COCOMO II approach:

$$Duration = 3.67 \cdot (Effort)^{0.28 + 0.2 \cdot (E-0.91)}$$

Where the Effort and E are the same as the ones for the "Effort equation".

We obtain: 

$$Duration = 3.67 \cdot 11.95^(0.28 + 0.2\cdot(1.063-0.91)) = 3.67 \cdot 11.95^{0.31} = 7.93$$

Finally, knowing the approximative effort and time needed to carry through the project, we can easily compute the size of the effort team needed: 

$$\#people = Effort/Duration = 11.95/7.93 = 1.51$$

Of course it is not possible to use 1.51 workers but we can easily imagine two people starting the project and one dropping out at about the half of the project. However, estimating the size of the team using the Effort and Duration obtained using the COCOMO II approach could seem paradoxical in the sense that an evaluation of the qualities of the developing team needs to be done to compute some drivers. 

### 2.2.5. Detailed report
We decided to give a detailed report performed by the following external site [http://csse.usc.edu/tools/COCOMOII.php](http://csse.usc.edu/tools/COCOMOII.php).  
This report gives us important information about effort like the effort estimated per month and per part.

![Input data][cocomoData]\

![Results][cocomoResults]\


[//]: # (pagebreak)

# 3. Tasks
We considered all real assignments except the code inspection, since it is not related to this application, with the real deadlines.  
We also considered other tasks like the implementation that we decided to start immediately after the design, because we would have had everything needed to start it. We don't use the duration provided by the COCOMO because we wouldn't have had the time to complete it in time (considering the course length).

We used a Gantt diagram to show the tasks with the deadlines.


![Gantt][gantt]\

[//]: # (pagebreak)

# 4. Allocate resources
Since for the parts really done everyone worked with analogous working hours, we considered that for all parts everyone works on them with the same amount of hours.  
We have decided to dedicate to development only 50% of time because during it there were other parts to do, Christmas holiday and some *in itinere* exams.

We used a diagram to show the allocation of human resources linked with the tasks.

**Note:** with 100% we mean 100% of time allocated to this course per day considering the number of CFU/ECTS.

![Resources][resources]\

[//]: # (pagebreak)

# 5. Risks

## 5.1. Project risks

  - requirements change:  requirements are changed by the committee.
  - bad schedule: tasks previsions may be unrealistic.
  - regulatory changes: country may change its regulatory policy concerning our operation field.

## 5.2. Technical risks

  - wrong UI: the developed User Interface does not satisfy the committee.
  - bad external data source: external data sources may be badly exposed and organized.
  - overload: the system cannot satisfy a large amount or requests.

## 5.3. Business risks

  - too few clients: the sales team did not find enough customers for the product.
  - competitors: another company can develop a similar product, reducing our market opportunities.

## 5.4. Risks probability and severity

| Risk | Probability | Severity |
|----------------------|---|--------------|
| requirements change  | L | Critical     |
| bad schedule         | M | Critical     |
| regulatory changes   | L | Marginal     |
| wrong UI             | L | Marginal     |
| bad ext. data source | H | Critical     |
| overload             | H | Critical     |
| too few clients      | M | Catastrophic |
| competitors          | L | Critical     |

[//]: # (pagebreak)

## 5.5. Contingency plan

| Risk | Strategy |
|------|----------|
| bad ext. data source | Use the Adapter pattern to minimize changes to program code,\ |
|  |  developing an adapter for any new external source |
| overload | move the system to an highly scalable platform like AWS |
| too few clients | promote our product using some advertising |

## 5.6. Montecarlo analysis 

We also decided to provide the Montecarlo risk analysis, about effort.

In this case the Montecarlo analysis iterations are made by different (random) values for (k)slock with the real value as average and with a fixed standard deviation. So we have a normal distribution of some values for (k)slock.  
In this case the system calculates the efforts for every different value of (k)slock and we obtain a normal distribution of different efforts.  
**Note:** The distribution used is inserted on the [detailed report section 2.2.5](#detailed-report).

This is very useful to give us an idea about the feasible worst cases and to test the robustness of the project plan.

![Montecarlo][cocomoMontecarlo]\


[//]: # (pagebreak)

# 6. Used tools
* Github: for version controller
* Gedit and ReText: to write MarkDown with spell check
* Ganttproject: to draw Gantt diagrams
* Pandoc: to create pdf

[//]: # (pagebreak)

# 7. Hours of work
## Claudio Cardinale
  * 21/01/16: 1h
  * 23/01/16: 1h
  * 26/01/16: 4h
  * 28/01/16: 1h
  * 01/02/16: 30m
  * 02/02/16: 1h

## Gilles Dejaegere
  * 23/01/16: 3h
  * 24/03/16: 2h
  * 25/03/16: 30 min
  * 26/03/16: 2h 
  * 28/01/16: 1h

## Massimo Dragano
 * 28/01/16: 2h
 * 29/01/16: 1h
 * 30/01/16: 30m
 * 01/02/16: 2h

[cocomoData]:../resources/cocomo1.png?raw=true
[cocomoResults]:../resources/cocomo2.png?raw=true
[cocomoMontecarlo]:../resources/cocomo3.png?raw=true
[gantt]:../resources/gantt.png?raw=true
[resources]:../resources/resources.png?raw=true
[model]: ../../RASD/resources/class_diagram.png?raw=true
