accessing
solveKernelAsLUP: x output: y alpha: alpha
	1 to: x numberOfRows do: [ :i |
		x at: i at: i put: (x at: i at: i) + alpha.
		].
	^x lupDecomposition solve: y.
	
	
	
	