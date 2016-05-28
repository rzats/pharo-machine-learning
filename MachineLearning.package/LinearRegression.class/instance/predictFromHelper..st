evaluation
predictFromHelper: helper
	"comment stating purpose of message"
	| result tempSum |
	result := helper dataset collect: [ :row |
		tempSum := intercept.
		coefs keysDo: [ :key|
			tempSum := tempSum + ((row at: (helper indexOfName: key)) * (coefs at: key)).
			 ].
		tempSum.
		 ].
	^result.