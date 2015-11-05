open string

sig Client {
 phoneNumber: MString
}

fact phoneNumberAreUnique {
 all c1,c2: Client | c1 != c2 => c1.phoneNumber != c2.phoneNumber
}

pred show() {
}

run show
