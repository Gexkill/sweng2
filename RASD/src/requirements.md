#Functional requirements
##Taxi drivers:
* allow taxi drivers to sign up into the system
    * the system must be able to check if it is an official taxi driver
    * system only allows official taxi drivers
* log in
    * the system must be able to check if the password is correct
    * let log in only if password is correct.
* say they are avaiable
    * the system must put the taxi driver in the right queue
* say they are not more avaiable
    * retire the taxi driver from his queue
* able to accept or decline a **reservation**      <!--- put reservation in lewic -->
    * the system must ask to the taxi driver if he accepts the reservation.
    * the system must ask to the next taxi if the former declined the reservation
    * the system must notify the user with the code of the taxi accepting the ride
    * the system must notify the user if no taxi accepts the ride
* able to accept or decline a request
    * the system must ask to the taxi driver if he accepts the ride.
    * the systems must put a taxi driver at the end of the queue if the taxi driver reject a ride
    * the system must ask to the next taxi if the former declined the ride
    * the system must notify the user with the code of the taxi accepting the ride
    * the system must notify the user if no taxi accepts the ride

##Users:
* taxi sharing
    * the system must provide a functionallity  for taxi sharing
    * the system must be able to find if other users want to make the same ride 
* precise the origin
* register

#Non-functional requirements
##User interface
##Documentation
##Architectural consideration