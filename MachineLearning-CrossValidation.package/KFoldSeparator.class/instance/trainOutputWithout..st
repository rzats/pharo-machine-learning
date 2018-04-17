as yet unclassified
trainOutputWithout: i
	"comment stating purpose of message"
	| rIndex bIndex rows |
	rows := Array new: size - (blocks at: i) value size.
	rIndex := 1.
	bIndex := 1.
	blocks do: [ :block |
		i ~= bIndex ifTrue: [ 
			block value do: [ :el |
				rows at: rIndex put: el.
				rIndex := rIndex + 1.
				 ]
			 ].
		
		bIndex := bIndex + 1.
		 ].
	^rows asPMVector.
	