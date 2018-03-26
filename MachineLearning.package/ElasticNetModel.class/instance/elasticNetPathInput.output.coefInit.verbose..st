as yet unclassified
elasticNetPathInput: X output: y coefInit: inCoef verbose: isVerbose 
	| l1Reg l2Reg nSamples nFeatures colNorms R XtA nIters wMax dwMax dwTol xT|
	xT := X transpose.
	nSamples := X numberOfRows.
	nFeatures := X numberOfColumns.
	coefs := inCoef.
	dwTol := tol.
	l1Reg := alpha * l1Ratio * nSamples.
	l2Reg := alpha * (1 - l1Ratio) * nSamples.
	colNorms := X columnsCollect: [ 
		:col | (col inject: 0 into: [ :accum : val| accum + val squared ]) 
		 ].
	
	R := (Array new: nSamples withAll: 0) asVector.
	XtA := (Array new: nFeatures withAll: 0) asVector.
	gap := tol + 1.
	nIters := 0.
	
	R := y - (X * coefs).
	tol := y * y * tol.
	1 to: maxIter do: [ 
		:iter |
		wMax := 0.
		dwMax := 0.
		1 to: nFeatures  do: [ :ii |
			| i |
			"cyclic now, add random"
			i := ii.
			(colNorms at: i) ~= 0  ifTrue: [  
				| wii tmp colI newW dwii |
				wii := coefs at: i.
				colI := xT rowAt: i.
				wii ~= 0 ifTrue: [ 
					"reimplement with different matrix"
					R := R + (colI * wii).
					 ].
				
				tmp := colI * R.
				newW := tmp sign * ((tmp abs - l1Reg) max: 0) / (l2Reg  + (colNorms at: i)) .
				coefs at: i put: newW.
				newW ~= 0 ifTrue: [ 
					R := R - (colI * newW).
					 ].
				
				dwii := (newW - wii) abs.
				dwMax := dwMax max: dwii.
				wMax := newW max: dwMax.
			 ] 
		 ].
	
		(wMax = 0 or: [ (dwMax  / wMax) < dwTol or: iter = maxIter ]) ifTrue: [ 
			| dualNormXta rNorm2 wNorm2 const l1Norm|
			XtA := xT * R- (l2Reg * coefs).  
			dualNormXta := XtA reduce: [ :a :b | a abs max: b abs ].
			rNorm2 := R * R.
			wNorm2 := coefs * coefs.
			
			dualNormXta > l1Reg 
				ifTrue: [ 
					| aNorm2 |
					const := l1Reg / dualNormXta.
					aNorm2 := rNorm2 * (const squared).
					gap := 0.5 * (rNorm2 + aNorm2).
					 ]
				ifFalse: [ 
					const := 1.
					gap := rNorm2.
					 ].
			
			l1Norm := coefs reduce: [ :a :b | a abs + b abs ].
			gap := gap + (l1Reg * l1Norm)  - (R * y * const) + (0.5 * l2Reg * (1 + (const squared)) * wNorm2).
			
			gap < tol ifTrue: [ 
				
				^ iter.
				 ]
			
			 ].
		
		nIters := iter.
	
	].

	^nIters.
	
	
	
	

