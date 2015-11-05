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

pred show() {
 #Queue > 0
}

run show
