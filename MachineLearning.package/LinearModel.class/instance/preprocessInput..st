accessing
preprocessInput: X
	"center and scale input"
	| inputX |
	
	center ifTrue: [ 
		inputX := X transpose.
		xOffset := (inputX rowsCollect: [ 
			:row | self center: row.
		 ]) asVector.
	
		xScale := (inputX rowsCollect: [ 
			:row | 
			normalize ifTrue: [ 
				self normalize: row
			 ]
			ifFalse: [ 
				1
			].
		 ]) asVector.
	
		inputX := inputX transpose.
	] ifFalse: [
		xOffset := (Array new: X numberOfColumns withAll: 0) asVector.
		xScale :=  (Array new: X numberOfColumns withAll: 1) asVector.
	].
	^ inputX.