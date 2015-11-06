open driver
open path

sig Ride {
 drivers: some Driver,
 path: Path,
 prices: Client -> Int
}

fact RideContainsPricesForItsClients {
	all r: Ride | r.prices.(Int) = r.path.positions.elems.(client)
}

pred show() {
}

run show
