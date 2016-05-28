evaluation
predictVal: entity
	"comment stating purpose of message"
	| result |
	result := intercept.
	coefs keysAndValuesDo: [ :key :val | result := result + (entity at: key) * val ].
	^result.