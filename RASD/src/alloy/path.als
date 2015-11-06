open position

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

check pathPositionsAreEven

check clientGetInAndGetOut

check pathSameNumberOfLoadAndDrop

pred show() {
 #Path = 1
 one p:Path| #p.positions > 3
}

run show for 6
