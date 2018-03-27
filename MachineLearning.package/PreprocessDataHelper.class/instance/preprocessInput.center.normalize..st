as yet unclassified
preprocessInput: X center: center normalize: normalize
	"center and scale input"
	| inputX xOffset xScale inputXTransposed |
	
	inputXTransposed := X transpose.
	center ifTrue: [ 		
		xOffset := (inputXTransposed rowsCollect: [ 
			:row | self center: row.
		 ]) asVector.
	
		xScale := (inputXTransposed rowsCollect: [ 
			:row | 
			normalize ifTrue: [ 
				self normalize: row
			 ]
			ifFalse: [ 
				1
			].
		 ]) asVector.
	] ifFalse: [
		xOffset := (Array new: X numberOfColumns withAll: 0) asVector.
		xScale :=  (Array new: X numberOfColumns withAll: 1) asVector.
	].

	inputX := inputXTransposed transpose.
	^ PreprocessInputResult createWithOffset: xOffset  scale: xScale x: inputX xT: inputXTransposed.