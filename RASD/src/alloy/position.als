open client

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

pred show() {
 #StopPosition > 0
}

run show
