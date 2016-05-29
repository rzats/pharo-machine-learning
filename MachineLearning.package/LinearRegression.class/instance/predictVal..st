evaluation
predictVal: entity
	"comment stating purpose of message"
	| result |
	result := intercept.
	meansDict size = 0 
	ifTrue: [ 
		coefs keysAndValuesDo: [ :key :val | result := result + ((entity at: key) * val)].
		 ]
	ifFalse: [ 
		coefs keysAndValuesDo: [ :key :val | result :=  (entity at: key) * (val - (meansDict at: key)) + result]
		 ].
	
	^result.