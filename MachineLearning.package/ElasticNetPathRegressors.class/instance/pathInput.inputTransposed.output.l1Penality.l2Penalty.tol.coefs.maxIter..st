as yet unclassified
pathInput: x inputTransposed: xT output: y l1Penality: l1 l2Penalty: l2 tol: inTol coefs: startWeigts
maxIter: maxIter
	"coordinate descent for ElasticNet penalty, when l2 == 0 is equal to lasso"
	| nSamples nFeatures colNorms residuals xta nIters wMax dwMax dwTol weights gap tol|
	tol := inTol.
	nSamples := x numberOfRows.
	nFeatures := x numberOfColumns.
	weights := startWeigts copy asPMVector.
	dwTol := tol.
	colNorms := x columnsCollect: [ 
		:col | (col inject: 0 into: [ :accum : val| accum + val squared ]) 
		 ].
	
	residuals := (Array new: nSamples withAll: 0) asPMVector.
	xta := (Array new: nFeatures withAll: 0) asPMVector.
	gap := tol + 1.
	nIters := 0.
	
	residuals := y - (x * weights).
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
				wii := weights at: i.
				colI := xT rowAt: i.
				wii ~= 0 ifTrue: [ 
					"reimplement with different matrix"
					residuals := residuals + (colI * wii).
					 ].
				
				tmp := colI * residuals.
				newW := tmp sign * ((tmp abs - l1) max: 0) / (l2  + (colNorms at: i)) .
				weights at: i put: newW.
				newW ~= 0 ifTrue: [ 
					residuals := residuals - (colI * newW).
					 ].
				
				dwii := (newW - wii) abs.
				dwMax := dwMax max: dwii.
				wMax := newW max: dwMax.
			 ] 
		 ].
	
		(wMax = 0 or: [ (dwMax  / wMax) < dwTol or: iter = maxIter ]) ifTrue: [ 
			| dualNormXta rNorm2 wNorm2 const l1Norm|
			xta := xT * residuals - (l2 * weights).  
			dualNormXta := xta reduce: [ :a :b | a abs max: b abs ].
			rNorm2 := residuals * residuals.
			wNorm2 := weights * weights.
			
			dualNormXta > l1 
				ifTrue: [ 
					| aNorm2 |
					const := l1 / dualNormXta.
					aNorm2 := rNorm2 * (const squared).
					gap := 0.5 * (rNorm2 + aNorm2).
					 ]
				ifFalse: [ 
					const := 1.
					gap := rNorm2.
					 ].
			
			l1Norm := weights reduce: [ :a :b | a abs + b abs ].
			gap := gap + (l1 * l1Norm)  - (residuals * y * const) + (0.5 * l2 * (1 + (const squared)) * wNorm2).
			
			gap < tol ifTrue: [ 
				^ElasticNetPathResult createWithCoefs: weights iters: iter gap: gap.
				 ]		
			 ].
		
		nIters := iter.
	
	].

	^ElasticNetPathResult createWithCoefs: weights iters: nIters gap: gap.
	
	

	