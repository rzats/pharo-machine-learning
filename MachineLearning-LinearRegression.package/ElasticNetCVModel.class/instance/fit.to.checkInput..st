configuration
fit: x to: y checkInput: check 
	"used to start fitting elastic model"
	| foldsRes alphaGrid preprocessInput preprocessOutput xTy|
	
	preprocessInput := self preprocessInput: x center: center normalize: normalize.
	preprocessOutput := self preprocessOutput: y center: center.
	xTy := preprocessInput xT * preprocessOutput y.
	
	cv input: x output: y folds: nFolds.
	alphas ifNotNil: [ 
		alphas sort reverse
		 ].
	
	alphaGrid := self generateAlphaGridForL1RatiosWithXty: xTy  nSamples: y size.
					
	foldsRes := cv collect: [ :trainX :trainY :testX :testY | | processTrainX processTrainY txTx txTy |
		processTrainX := 
			self preprocessInput: trainX center: (check and: center) normalize: normalize.
		processTrainY :=
			self preprocessOutput: trainY center: center.
		
		txTx := processTrainX xT * processTrainX x.
		txTy := processTrainY xT * processTrainY y.
		
		alphaGrid collect: [ :point | | l1 alphaL1  |
			l1 := point first.
			alphaL1 := point second.
			self pathResidualsPrecomputed: alphaL1 l1Ratio: l1 trainxTx: txTx trainxTy: txTy trainY: processTrainY y.
			 ].
		 ]. 	
	
	
	
