open position

sig Path {
 positions: seq StopPosition
} {
 #positions >= 2
}

fact pathPositionsAreUnique {
  all p: Path | not p.positions.hasDups
}


fact pathSameNumberOfLoadAndDrop {
 all p: Path | #(p.positions.elems & DropPosition) = #(p.positions.elems & LoadPosition)
}

fact pathClientHasALoadAndADrop {
 all p: Path | all i1: p.positions.inds |
	one i2: p.positions.inds | i2 != i1 and 
   p.positions[i1].client = p.positions[i2].client
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

check pathPositionsAreEven

pred show() {
 #Path = 1
 one p:Path| #p.positions > 3
}

run show for 4
