accessing
unitVariance: vect
	"divide by scale and return it"

	| avg std |
	avg := self avg: vect.
	std := (vect inject: 0 into: [ :x :y | x + (y - avg) squared ]) sqrt.
	std = 0
		ifTrue: [ std := 1 ].
	vect doWithIndex: [ :el :i | vect at: i put: el / std ].
	^ std.