as yet unclassified
preprocessInput: X center: center normalize: normalize
	"center and scale input"
	| inputX xOffset xScale inputXTransposed |
	
	inputXTransposed := X transpose.
	center ifTrue: [ 		
		xOffset := (inputXTransposed rowsCollect: [ 
			:row | self center: row.
		 ]) asPMVector.
	
		xScale := (inputXTransposed rowsCollect: [ 
			:row | 
			normalize ifTrue: [ 
				self normalize: row
			 ]
			ifFalse: [ 
				1
			].
		 ]) asPMVector.
	] ifFalse: [
		xOffset := (Array new: X numberOfColumns withAll: 0) asPMVector.
		xScale :=  (Array new: X numberOfColumns withAll: 1) asPMVector.
	].

	inputX := inputXTransposed transpose.
	^ PreprocessInputResult createWithOffset: xOffset  scale: xScale x: inputX xT: inputXTransposed.