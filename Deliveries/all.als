open util/boolean
sig Taxi {
code: Int,
seats: Int
} {
code > 0
seats > 0
seats <= 4
}

fact codeAreUnique {
all t1,t2: Taxi | (t1 != t2) => t1.code != t2.code
}


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

sig PhoneNumber { }

sig Client {
phoneNumber: PhoneNumber
}

fact phoneNumberAreUnique {
all c1,c2: Client | c1 != c2 => c1.phoneNumber != c2.phoneNumber
}


sig Position {
latitude: Int, // should be float
longitude: Int // should be float
}

abstract sig StopPosition extends Position {
client: one Client
}

sig LoadPosition extends StopPosition {
}

sig DropPosition extends StopPosition {
}

pred StopPosition.sameClient[other: StopPosition] {
this.client = other.client
}

pred StopPosition.complement[other: StopPosition] {
other != this
this.sameClient[other]
(this in DropPosition) <=> (other in LoadPosition)
}


sig Path {
positions: seq StopPosition
} {
#positions >= 2
}

fact pathPositionsAreUnique {
all p: Path | not p.positions.hasDups
}

fact pathClientHasALoadAndADrop {
all p: Path | all i1: p.positions.inds |
one i2: p.positions.inds | i2 != i1 and
let p1 = p.positions[i1] | let p2 = p.positions[i2] |
p1.complement[p2] and not ( one i3: p.positions.inds |
i3 != i2 and i3 != i1 and let p3=p.positions[i3] |
p3.complement[p1] or p3.complement[p2])
}

fact pathStartWithLoad {
all p: Path | p.positions.first in LoadPosition
}

fact pathEndWithDrop {
all p: Path | p.positions.last in DropPosition
}

assert pathPositionsAreEven {
all p:Path| rem[#p.positions, 2] = 0
}

assert clientGetInAndGetOut {
all p: Path| all i1: p.positions.inds | one i2: p.positions.inds |
i2 != i1 and let p0=p.positions[i1] | let p1=p.positions[i2] |
p0.complement[p1]
}

assert pathSameNumberOfLoadAndDrop {
all p: Path | #(p.positions.elems & DropPosition) = #(p.positions.elems & LoadPosition)
}





abstract sig Request {
path: Path,
passengers: Int
} {
passengers > 0
}

sig SingleRequest extends Request {
}

sig SharedRequest extends Request {
}

sig MergedRequest extends Request {
}


abstract sig Queue {
s: seq univ
}

sig DriverQueue extends Queue {
} {
s.elems in Driver
}

sig RequestQueue extends Queue {
} {
s.elems in Request
}

fact enqueuedDriversMustBeAvailable {
all d: DriverQueue.s.elems | d.available.isTrue
}

fact availableDriversMustBeEnqueued {
all d: Driver | d.available.isTrue <=> d in DriverQueue.s.elems
}

fact enqueuedElemntsMustBeUnique {
all q: Queue | not q.s.hasDups
}

fun peek[s: (seq/Int -> univ)]: univ {
s.first
}

fun peek[q: Queue]: univ {
q.s.peek
}

fun peek[q: DriverQueue]: Driver {
q.s.peek & Driver
}

fun peek[q: RequestQueue]: Request {
q.s.peek & Request
}

pred Queue.add[q: Queue, e: univ] {
q.s = this.s.insert[#this.s, e]
}


/**
* Precondition: ~ this.s.isEmpty
*/
pred Queue.get[q: Queue, e: univ] {
e in this.s.elems
q.s = this.s.delete[0]
not e in q.s.elems
}


assert getInverseOfAdd {
all q0,q1,q2: Queue, e: univ | q0.s.isEmpty and
q0.add[q1, e] and q1.get[q2, e] => q0.s = q2.s
}



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


sig Ride {
drivers: some Driver,
path: Path,
prices: Client -> Int
}

fact RideContainsPricesForItsClients {
all r: Ride | r.prices.(Int) = r.path.positions.elems.(client)
}


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
check pathPositionsAreEven
check clientGetInAndGetOut
check pathSameNumberOfLoadAndDrop
check getInverseOfAdd
run add for 5
run get for 5
