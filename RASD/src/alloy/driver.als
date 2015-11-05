open util/boolean
open taxi

sig Driver {
 taxi: one Taxi,
 available: one Bool
}

fact allTaxiAreOwned {
  Driver.taxi = Taxi
}

fact taxiHaveOnlyOneDriver {
  all d1, d2:Driver | d1 != d2 => d1.taxi != d2.taxi
}

pred show(){
 #Driver > 0
}

run show for 4
