open position
open path

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

pred show() {
}

run show
