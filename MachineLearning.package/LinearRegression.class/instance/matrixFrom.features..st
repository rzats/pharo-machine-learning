helperMethods
matrixFrom: helper features: features
	"comment stating purpose of message"

	| matrix dataset rowIndex colIndex|
	dataset := helper dataset.
	matrix := DhbVector new: dataset size.
	1 to: dataset size do: [ :i | matrix at: i put: (DhbVector new: (features size + 1)).].
	rowIndex := 1.
	matrix do: [ :row | 
		row at: 1 put: 1. 
		colIndex := 2.
		features do: [ :feature | 
			row at: colIndex put: ((dataset at: rowIndex) at:  (helper indexOfName: feature)).
			colIndex := colIndex + 1.
			 ].
		rowIndex := rowIndex + 1. 
		].
	
	^DhbMatrix rows: matrix.