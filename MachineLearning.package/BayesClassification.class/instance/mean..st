mathematical functions
mean: numbers
	| elementSum |
	elementSum := numbers inject: 0 into: [ :sum :each | sum + each ].
	^ elementSum / numbers size