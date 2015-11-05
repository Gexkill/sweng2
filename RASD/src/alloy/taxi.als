sig Taxi {
 code: one Int,
 seats: one Int
} {
 code > 0
 seats > 0
 seats <= 4
}

fact codeAreUnique {
 all t1,t2: Taxi | (t1 != t2) => t1.code != t2.code
}

pred show() {
}

run show for 4
