open path
open time

abstract sig Reservation {
 path: Path,
 at: DateTime,
 passengers: Int
} {
 passengers > 0
}

sig SingleReservation extends Reservation {
}

sig SharedReservation extends Reservation {
}

pred show() {
 #Reservation > 0
}

run show for 4
