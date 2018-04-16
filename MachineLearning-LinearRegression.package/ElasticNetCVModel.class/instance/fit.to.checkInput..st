configuration
fit: x to: y checkInput: check 
	"used to start fitting elastic model"
	| foldsRes alphaGrid preprocessInput preprocessOutput xTy |
	
	preprocessInput := self preprocessInput: x center: center normalize: normalize.
	preprocessOutput := self preprocessOutput: y center: center.
	xTy := preprocessInput xT * preprocessOutput y.
	
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
		txTy := processTrainY xT * processTrainY y.
		
		foldMses := alphaGrid collect: [ :point | | l1 alphaL1  |
			l1 := point first.
			alphaL1 := point second.
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
		(1 to: (alphaGrid at: i) size) collect: [ :j |
			(foldsRes inject: 0 into: [ :sum :el | sum + ((el at: i) at: j)  ]) / nFolds.
			 ]
		 ].
	
	minMse := (mses at: 1) at: 1.
	minL1 := (alphaGrid at: 1) first.
	minAlpha := (alphaGrid at: 1) second at: 1.
	
	1 to: mses size do: [ :i | 
		1 to: (mses at: i) size do: [ :j |
			((mses at: i) at: j) < minMse ifTrue: [ 
				minL1 := (alphaGrid at: i) first.
				minAlpha := (alphaGrid at: i) second at: j.
				 ].
			 ].
		].
	
	model := ElasticNetModel createWithAlpha: minAlpha maxIter: maxIter tol: tol selection: 'cyclic' l1Ratio: minL1. 
		
		 
		
	
		
	
	
