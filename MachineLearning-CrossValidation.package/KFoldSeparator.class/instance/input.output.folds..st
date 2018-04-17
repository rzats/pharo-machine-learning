as yet unclassified
input: x output: y folds: n
	| dataPoints blockSize  |
	size := y size.
	size < n ifTrue: [ 
		^ nil.
		 ].
	dataPoints := (1 to: size) collect: [ :i | (x rowAt: i) -> (y at: i) ].
	dataPoints shuffle.
	blockSize := y size // n.
	 
	blocks := (1 to: n) collect: [ :i | | start next blockX blockY |
		start := (i - 1) * blockSize + 1.
		next := i = n ifTrue: [ n ] ifFalse: [(i * blockSize) ].
		blockX := (start to: next) collect: [ :j | (dataPoints at: j) key ].
		blockY := (start to: next) collect: [ :j | (dataPoints at: j) value ].
		blockX -> blockY.
		 ].
	
	