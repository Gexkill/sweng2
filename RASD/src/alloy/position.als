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

pred show() {
 #StopPosition > 0
}

run show
