#Description of the given problem
We will project and implement myTaxiService, which is a service based on mobile applications and a web applications, with two different target of people:

* taxi driver
* clients

The system allow clients to reserve taxi via mobile or web app, using GPS position to identify client's zone and find taxi in the same zone. On the other side the app allow to taxi to accept or reject a reservation.

The system includes extra services and functionalities such as taxi sharing
##Actual system
Until now the taxi company has a system where the clients have to call a call center communicating its position via voice (so it can be not correct), the call center's operator insert the request into an internal information system and the taxi driver can accept or reject it via an dedicated hardware device.

The system sen automatically an SMS to the client with the estimated arrival time and the taxi name

#Goals
The main goal the system is decrease costs and create a more efficient and precise service.

The main features are:

##Taxi drivers:
* allow taxi drivers to sign up into the system
* log in
* say they are avaiable
* able to accept or decline a request

##Users:
* taxi sharing
* precise the origin
* 

#Domain properties
* taxi drivers already registered to the old system
* if taxi accepts the ride he do it
* if user request the taxi he takes it
* GPS gives the right position
* GPS is always working
* taxi drivers answer in less than 5 minutes 
* the user pays the taxi driver directly

#Glossary
#Assumptions
* There exist an mobile app for users where user can make a reservation using the GPS position or inserting his position
* The users are not registered on the system, because we need only their name and their position **SEE REQUIREMENTS** An user is identified by his personal data: name and phone number
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