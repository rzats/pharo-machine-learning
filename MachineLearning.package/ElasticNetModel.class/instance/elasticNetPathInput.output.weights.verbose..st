as yet unclassified
elasticNetPathInput: X output: y weights: inWeights verbose: isVerbose 
	| l1Reg l2Reg nSamples nFeatures colNorms R XtA gap nIters wMax dwMax weights|
	
	nSamples := X numberOfRows.
	nFeatures := X numberOfColumns.
	weights := inWeights.
	l1Reg := alpha * l1Ratio * nSamples.
	l2Reg := alpha * (1 - l1Ratio) * nSamples.
	colNorms := X columnsCollect: [ 
		:col | (col inject: 0 into: [ :accum : val| accum + val squared ]) sqrt
		 ].
	
	R := (Array new: nSamples) asVector.
	XtA := (Array new: nFeatures) asVector.
	gap := tol + 1.
	nIters := 0.
	
	R = y - X * weights.
	1 to: maxIter do: [ 
		:i |
		
		
		
		
		
		 ]
	
	
	
	

	