#Description of the given problem
We will project and implement myTaxiService, which is a service based on mobile applications and a web applications, with two different target of people:

* taxi driver
* clients

The system allow clients to reserve taxi via mobile or web app, using GPS position to identify client's zone and find taxi in the same zone. On the other side the app allow to taxi to accept or reject a reservation.

The system includes extra services and functionalities such as taxi sharing
##Actual system
Until now the taxi company has a system where the clients have to call a call center communicating its position via voice (so it can be not correct), the call center's operator insert the request into an internal information system and the taxi driver can accept or reject it via an dedicated hardware device.

The system send automatically an SMS to the client with the estimated arrival time and the taxi name

#Goals
The main goal of the system is to be more efficient and reliable than the existing one in order to decrease costs of the taxi management and offer a better service to the users.

The main features of the system are:

##Taxi drivers:
* [G1] Allow taxi drivers to sign up into the system.
* [G2] Allow taxi drivers to log in the system.
* [G3] Allow taxi drivers to precise to the system if they are available or not.
* Taxi drivers should receive a notification for incoming request.   **is it a goal ?**
* Taxi drivers should receive a notification if they have to take care of another user (during a shared ride).   **is it a goal ?**
* [G4] Allow taxi drivers to accept or decline incoming requests for an immediate ride
* [G5] Allow taxi drivers to accept or decline incoming request for a later reservation.

##Users:
* [G6] Allow users to request for an immediate taxi ride.
* [G7] Allow users to request for the reservation of a taxi at least two hours in advance.
* Users should receive a notification with the code of the taxi that takes car of the user's request. **is it a goal ?**
* Users should be notified if no taxi driver is able to perform the users request. **Is this a goal ? **
* [G8] Allow users to require to share the taxi.

#Domain properties
We suppose that these properties hold in the analyzed world :

* Actual drivers are already registered on the previous system
* A taxi driver accepting a ride of reservation will actually take care of the request.
* A user requiring a taxi will actually take it.
* All the GPS always give the right position. 
* The GPS of the taxi drivers can not be switched of.
* Taxi drivers answer all types of demands in less than 5 minutes.
* The user pays the taxi driver directly for each commission.
* A taxi can be on only one zone at the same time, this is the real zone.
* Users make a reservation two hours before of the ride **Here as domain or do we have to do the requirements into G7?**

#Glossary
* User: he is a client of the service. He should insert each time he performs a request the following information
    * Name
    * Phone number
    * Position, it can be taken automatically from GPS (either via APP or Web browser)
* Taxi driver: he is a taxi driver registered on the taxi company, that grants to taxi driver the access to this information system
* Queue: it is the taxi queue, when more than one taxi are in the same zone, there is a FIFO queue. So in this way when there is a new client the oldest taxi can take it. there is a queue for each zone.
* Ride: it starts when the taxi receive the request and ends when leave the last client of the ride. The simple ride is specified by start ride, user and taxi; but other ride types (like reservation or taxi sharing) have other parameters.
* Taxi sharing: it is the possibility that if different people (it's not require that they know each other) of the same start zone go to the same direction, even if the end is not the same, to use the same taxi and to have an unique group fee. A sharing ride is identified by users that use it and for each user the start and end point
* Reservation: it is the ability to reserve a taxi until two hours before time of ride, so when a reservation is done the system make a normal taxi request 10 minutes before the ride. The reservation is identified by start point, end point, user and time.
* Taxi request: it is the request that the system send (automatically or after an user request) to taxi to specify a ride, specifying start point, user and other elements if they are available.
* User request: it is the request for a taxi drive as soon as possible, it contains the the user data and the start point that can be get by GPS (current position) or inserting manually
* Zone: is a zone of approximately 2 km^2, the city is split into these zones. From taxi position the system get his zone and inserts the taxi into the zone queue. So the system guarantees a fair management of taxi queues
* Task: a task is an action done automatically from the server, for example "send request 10 minutes before ride" is a task
* Taxi: is a means of transport that can bring only 4 passengers.

#Assumptions
* There exist an mobile application for users where user can make a reservation using the GPS position or by inserting his position
* The users are not registered on the system, because we need only their name and their position. **SEE REQUIREMENTS** An user is identified by his personal data: name and phone number
* There are only normal taxis for 4 passengers.

#Constrains
##Regulatory policies
The system must be require to user/taxi driver the permission to get his position and he have to manage sensible data (position, phone number) respecting the privacy law
##Hardware limitations
* Mobile app
    * taxi driver:
        * 3G connection
        * GPS
        * Space for app package
    * user:
        * 3G connection
        * Space for app package  

* Web app
    * Modern browser with AJAX support
    * ...

##Interfaces to other applications
Interface with the older system to import old data the first time, from that moment all new taxi drivers will be automatically added to the new system
##Parallel operation
The server support parallel operations from different users and different taxi drivers.
##Reference documents
...
#Proposed system
We will implement a client-server architecture based on common REST API, so with just one server application we manage web application and mobile application, obviously we will have version for taxi driver and version for users.
![Architecture](../resources/architecture.png?raw=true)
**WRITE MORE DETAILS**

#Identifying stakeholders **HERE OR INTO 'Actor identifying'?**
**Do we have to write city or teachers?**
#Other considerations about the system
