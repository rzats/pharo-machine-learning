as yet unclassified
trainInputWithout: i
	"comment stating purpose of message"
	| rIndex bIndex rows |
	rows := Array new: size - (blocks at: i) key size.
	rIndex := 1.
	bIndex := 1.
	blocks do: [ :block |
		i ~= bIndex ifTrue: [ 
			block key do: [ :el |
				rows at: rIndex put: el.
				rIndex := rIndex + 1.
				 ]
			 ].
		
		bIndex := bIndex + 1.
		 ].
	^PMMatrix rows: rows.
	