as yet unclassified
trainInputWithout: i
	"comment stating purpose of message"
	| rIndex bIndex rows |
	rows := Array new: size - (blocks at: i) first size.
	rIndex := 0.
	bIndex := 0.
	blocks do: [ :block |
		i ~= bIndex ifTrue: [ 
			block first do: [ :el |
				rows at: rIndex put: el.
				rIndex := rIndex + 1.
				 ]
			 ].
		
		bIndex := bIndex + 1.
		 ].
	^PMMatrix rows: rows.
	