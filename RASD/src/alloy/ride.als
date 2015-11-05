open driver
open path

sig Ride {
 drivers: some Driver,
 path: Path
}

pred show() {
}

run show
