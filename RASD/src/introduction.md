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
We suppose that these properties hold in the analysed world :

* Actual drivers are already registered on the previous system
* A taxi driver accepting a ride of reservation will actually take care of the request.
* A user requiring a taxi will actually take it.
* All the GPS always give the right position. 
* The GPS of the taxi drivers can not be switched of.
* Taxi drivers answer all types of demands in less than 5 minutes.
* The user pays the taxi driver directly for each commission.

#Glossary
#Assumptions
* There exist an mobile application for users where user can make a reservation using the GPS position or by inserting his position
* The users are not registered on the system, because we need only their name and their position. **SEE REQUIREMENTS** An user is identified by his personal data: name and phone number
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
Interface with the older system
##Parallel operation
The server support parallel operations from different users and different taxi drivers.
##Reference documents
...
#Proposed system
#Identifying stakeholders **HERE OR INTO 'Actor identifying'?**
#Other considerations about the system