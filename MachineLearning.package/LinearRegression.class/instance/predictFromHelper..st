evaluation
predictFromHelper: helper
	"comment stating purpose of message"
	| result tempSum |
	meansDict size = 0 
		ifTrue: [ 
			result := helper dataset collect: [ :row |
			tempSum := intercept.
			coefs keysDo: [ :key|
				tempSum := tempSum + ((row at: (helper indexOfName: key)) * (coefs at: key)).
				 ].
			tempSum.
		 ].
		]
		ifFalse: [ 
			result := helper dataset collect: [ :row |
			tempSum := intercept.
			coefs keysDo: [ :key|
				tempSum := tempSum + (((row at: (helper indexOfName: key)) - (meansDict at: key)) * (coefs at: key)).
				 ].
			tempSum.
			 ]
		]
	.
	^result.