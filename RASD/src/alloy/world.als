open driver
open client
open zone
open ride
open request

one sig TaxiCentral {
 drivers: some Driver,
 clients: some Client,
 zones: some Zone
}

fact ownAllDrivers {
 TaxiCentral.drivers = Driver
}

fact ownAllClients {
 TaxiCentral.clients = Client
}

fact ownAllZones {
 TaxiCentral.zones = Zone
}

pred show() {
 #TaxiCentral = 1
 #Ride = 1
 #SharedRequest = 1
 #SingleRequest = 1
 #MergedRequest = 1
}

run show for 6
