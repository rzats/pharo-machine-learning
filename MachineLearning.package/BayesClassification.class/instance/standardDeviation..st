mathematical functions
standardDeviation: numbers
	| average variance |
	average := self mean: numbers.
	variance := numbers inject: 0 into: [ :sum :each | sum + (average - each raisedTo: 2) ].
	^ (variance / (numbers size - 1)) sqrt