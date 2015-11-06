open driver
open path

sig Amount {}

sig Ride {
 drivers: some Driver,
 path: Path,
 prices: Client -> Amount
}

fact RideContainsPricesForItsClients {
	all r: Ride | r.prices.(Amount) = r.path.positions.elems.(client)
}

pred show() {
}

run show
