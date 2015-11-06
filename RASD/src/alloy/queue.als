open driver
open request

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

run add for 5

/**
 * Precondition: ~ this.s.isEmpty
 */
pred Queue.get[q: Queue, e: univ] {
   	e in this.s.elems
	q.s = this.s.delete[0]
   	not e in q.s.elems
}

run get for 5

assert getInverseOfAdd {
  all q0,q1,q2: Queue, e: univ | q0.s.isEmpty and
 	q0.add[q1, e] and q1.get[q2, e] => q0.s = q2.s
}

check getInverseOfAdd

pred show() {
 #Queue > 0
}

run show
