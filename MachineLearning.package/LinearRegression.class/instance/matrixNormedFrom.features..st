helperMethods
matrixNormedFrom: helper features: features
	"comment stating purpose of message"

	| matrix dataset rowIndex colIndex  |
	dataset := helper dataset.
	matrix := DhbVector new: dataset size.
	1 to: dataset size do: [ :i | matrix at: i put: (DhbVector new: (features size + 1)).].
	
	rowIndex := 1.
	matrix do: [ :row | 
		row at: 1 put: 1. 
		colIndex := 2.
		features do: [ :feature | 
			row at: colIndex 
			put: ((dataset at: rowIndex) at:  (helper indexOfName: feature)).
			colIndex := colIndex + 1.
			 ].
		rowIndex := rowIndex + 1. 
		].
	means := (1 to: features size) collect: [ :i | 
		self mean: (matrix collect: [ :row| row at: i + 1 ])
		 ] .
	rowIndex := 1.
	matrix do: [ :row | 
		colIndex := 2.
		features do: [ :feature | 
			row at: colIndex 
			put: (row at:colIndex) - (means at: colIndex - 1).
			colIndex := colIndex + 1.
			 ].
		rowIndex := rowIndex + 1. 
		].
	norms := (1 to: features size) collect: [ :i | 
		self norm: (matrix collect: [ :row| row at: i + 1 ])
		 ] .
	
	rowIndex := 1.
	matrix do: [ :row | 
		colIndex := 2.
		row at: 1 put: 1 / dataset size sqrt.
		features do: [ :feature | 
			row at: colIndex 
			put: (row at:colIndex) / (norms at: colIndex - 1).
			colIndex := colIndex + 1.
			 ].
		rowIndex := rowIndex + 1. 
		].
	
	^DhbMatrix rows: matrix.