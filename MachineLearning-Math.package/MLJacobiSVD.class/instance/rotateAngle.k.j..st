accessing
rotateAngle: angle k: k j: j
	"k < j"
	| cos sin absErrK absErrJ |
	cos := angle x.
	sin := angle y.
	1 to: m do: [ :l | | ulk ulj |
		ulk := uT at: k at: l.
		ulj := uT at: j at: l.
		uT at: k at: l put: cos * ulk + (sin * ulj).
		uT at: j at: l put: sin * ulk negated + (cos * ulj) ].
	
	absErrK := s at: k.
	absErrJ := s at: j.
	s at: k put: (cos abs * absErrK  + (sin abs * absErrJ)).
	s at: j put: (sin abs * absErrK  + (cos abs * absErrJ)).
	
	^ 1 to: n do: [ :l | | vlk vlj |
		vlk := v at: l at: k.
		vlj := v at: l at: j.
		v at: l at: k put: cos * vlk + (sin * vlj).
		v at: l at: j put: (vlk negated * sin) + (cos * vlj) ]