accessing
solveAsCholesky: x inputT: xT output: y alpha: alpha
   | a xy |
	a := xT *  x.
	1 to: a numberOfRows do: [ :i |
		a at: i at: i put: (a at: i at: i) + alpha.
		].
	xy := xT *  y.
	^a choleskyDecomposition solve: xy.
	
	
	
	