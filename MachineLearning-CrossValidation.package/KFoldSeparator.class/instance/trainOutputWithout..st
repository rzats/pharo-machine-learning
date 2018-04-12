as yet unclassified
trainOutputWithout: i
	"comment stating purpose of message"
	| rIndex bIndex rows |
	rows := Array new: size - (blocks at: i) second size.
	rIndex := 0.
	bIndex := 0.
	blocks do: [ :block |
		i ~= bIndex ifTrue: [ 
			block second do: [ :el |
				rows at: rIndex put: el.
				rIndex := rIndex + 1.
				 ]
			 ].
		
		bIndex := bIndex + 1.
		 ].
	^rows asPMVector.
	