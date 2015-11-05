open position
open queue

sig Zone {
 drivers: one DriverQueue,
 requests: one RequestQueue,
 bounds: seq Position
} {
  #bounds > 2
  all p: bounds.elems | not p in StopPosition
  not bounds.hasDups
}

fact oneQueueForZone {
  all z1, z2: Zone | z1 != z2 =>
  z1.drivers != z2.drivers and z1.requests != z2.requests
}

fact zoneOwnAllDriverQueues {
  Zone.drivers = DriverQueue
}

fact zoneOwnAllRequestQueues {
  Zone.requests = RequestQueue
}

pred show(){
  #Zone > 1
}

run show for 4
