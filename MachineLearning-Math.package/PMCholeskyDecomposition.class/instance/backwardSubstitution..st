private
backwardSubstitution: anArray
	"Private"
	| n sum answer |
	n := matrix numberOfRows.
	answer := PMVector new: n.
	n to: 1 by: -1 do:
		[ :i |
		  sum := anArray at: i.
		
			"we swap j and i with places when we address matrix cause we working with L^T"
		  ( i + 1) to: n do: [ :j | sum := sum - ( (  matrix at: j at: i) * ( answer at: j))].
		  answer at: i put: sum / (  matrix at: i at: i).
		].
	^answer