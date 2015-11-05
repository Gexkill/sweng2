open driver
open client
open zone

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

pred show() {
 #TaxiCentral = 1
}

run show
