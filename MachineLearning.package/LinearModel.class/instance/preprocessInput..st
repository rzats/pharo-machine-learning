accessing
preprocessInput: X
	"center and scale input"
	| n inputX |
	n := 0.
	inputX := X transpose.
	xOffset := X rowsCollect: [ 
		:row | self center: row.
		 ].
	
	xScale := X rowsCollect: [ 
		:row | self normalize: row
		 ].
	
	inputX := inputX transpose.
	
	^ inputX.