configuration
fit: x to: y checkInput: check 
	"used to start fitting elastic model"
	| foldsRes alphaGrid preprocessInput preprocessOutput xTy |
	
	preprocessInput := self preprocessInput: x center: center normalize: normalize.
	preprocessOutput := self preprocessOutput: y center: center.
	xTy := preprocessInput xT * preprocessOutput y.
	nFolds ifNil: [ 
		nFolds := 3 min: y size.
		 ].
	
	cv input: x output: y folds: nFolds.
	alphas ifNotNil: [ 
		alphas sort reverse
		 ].
	
	alphaGrid := self generateAlphaGridForL1RatiosWithXty: xTy  nSamples: y size.
					
	foldsRes := cv collect: [ :trainX :trainY :testX :testY | | processTrainX processTrainY txTx txTy foldMses |
		processTrainX := 
			self preprocessInput: trainX center: (check and: center) normalize: normalize.
		processTrainY :=
			self preprocessOutput: trainY center: center.
		
		txTx := processTrainX xT * processTrainX x.
		txTy := processTrainX xT * processTrainY y.
		
		foldMses := alphaGrid collect: [ :point | | l1 alphaL1  |
			l1 := point key.
			alphaL1 := point value.
			self pathResidualsPrecomputed: alphaL1 
				l1Ratio: l1 
				trainxTx: txTx 
				trainxTy: txTy 
				preprocessTrainX: processTrainX 
				preprocessTrainY: processTrainY
				testX: testX
				testY: testY.
			 ].
		
		foldMses.
		 ]. 	
	
	mses := (1 to: alphaGrid size) collect: [ :i |
		(1 to: (alphaGrid at: i) value size) collect: [ :j |
			(foldsRes inject: 0 into: [ :sum :el | sum + ((el at: i) value at: j)  ]) / nFolds.
			 ]
		 ].
	
	minMse := (mses at: 1) at: 1.
	minL1 := (alphaGrid at: 1) key.
	minAlpha := (alphaGrid at: 1) value at: 1.
	
	1 to: mses size do: [ :i | 
		1 to: (mses at: i) size do: [ :j |
			((mses at: i) at: j) < minMse ifTrue: [ 
				minL1 := (alphaGrid at: i) key.
				minAlpha := (alphaGrid at: i) value at: j.
				minMse := ((mses at: i) at: j).
				 ].
			 ].
		].
	
	model := ElasticNetModel createWithAlpha: minAlpha maxIter: maxIter tol: tol selection: 'cyclic' l1Ratio: minL1. 
	model fit: x to: y checkInput: check.
		
		 
		
	
		
	
	
