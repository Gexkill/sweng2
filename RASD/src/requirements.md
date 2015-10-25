#Functional requirements
Assuming that the domain properties stipulated in the paragraph **[1.iii.]** hold, and, in order to fulfil the goals listed in paragraph **[1.ii]**, the following requirements can be derived.

The requirements are grouped under each goal from which it is derived. The goals are grouped following under the users concerned.
##Taxi drivers:
* [G1] Allow taxi drivers to sign up into the system:
    * The system must be able to check if it is an official taxi driver.
    * The system only allows official taxi drivers to register.
* [G2] Allow taxi drivers to log in the system:
    * The system must be able to check if the password provided is correct.
    * The system must only let the taxi driver log in if the provided password is correct.
* [G3] Allow taxi drivers to precise to the system if they are available or not:
    * The system must put the taxi driver in the appropriate queue when the taxi user becomes available.
    * The system must remove the taxi driver from the appropriate queue if he becomes unavailable.
* Taxi drivers should receive a notification for incoming request.   **is it a goal ?**
* Taxi drivers should receive a notification if they have to take care of another user (during a shared ride).   **is it a goal ?**
* [G4] Allow taxi drivers to accept or decline incoming  requests for an immediate ride:
    * The system must ask to the taxi driver if he accepts to perform the ride.
    * The system must replace a taxi driver at the end of the queue if he declines the ride.
    * The system must ask to the next taxi driver if the former one declined the ride.
    * The system must notify the user with the code of the taxi driver who has accepted the ride.
    * The system must notify the user if no taxi driver in the queue accept the ride.
* [G5] Allow taxi drivers to accept or decline incoming request for a later reservation:
    * The system must ask to the taxi driver if he accepts to perform the reservation.
    * The system must ask to the next taxi driver if the former one declined the reservation.
    * The system must notify the user with the code of the taxi driver who has accepted the reservation.
    * The system must notify the user if no taxi driver in the queue accept the reservation.
    *
    
##Users:
* [G6] Allow users to request for an immediate taxi ride :
    * The system must be able to check the position of the user.
    * The system must not accept request of users outside the area of the city.
    * The system must transfer the request to the appropriate taxi driver.
* [G7] Allow users to request for the reservation of a taxi at least two hours in advance.
    * The system must be able to check to origin and the destination of reservation.
    * The system must not accept reservations with an origin outside the area of the city.
    * The system must transfer the reservation to the appropriate taxi driver.
* Users should receive a notification with the code of the taxi that takes car of the user's request. **is it a goal ?**
* Users should be notified if no taxi driver is able to perform the users request. **Is this a goal ? **
* [G8] Allow users to require to share the taxi.
    * The system must be able to find if there are reservations or request for the same time period and having corresponding journeys.

#Non-functional requirements
##User interface
##Documentation
We will draft these documents to well-organize our work in the way to do in a
fewer time the best work as possible:
* RASD: Requirement Analysis and Specification Document, to well-
understand the given problem and to analyze in a detailed way which are
our goals and how to reach them defining requirements and specification.
* DD: Design Document, to define the real structure of our web application
and its tiers.
* Testing Document: a report of our testing experience of another myTaxyService
project.

##Architectural consideration
We will use the following technologies:
* Apache with php as API server and task service
* Mysql as sql server to store data persistently
* RESTfull and JSON for API communication
* Javascript, CSS and HTML to create responsive site that communicate to server using REST API
* Modern browser with javascript and ajax support
* Java and swing respectively for android and iOS apps, using original SDK
* Internet connection to communications of data
