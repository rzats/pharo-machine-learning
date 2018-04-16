as yet unclassified
pathResidualsPrecomputed: alphaPath l1Ratio: l1Ratio trainxTx: xTx trainxTy: xTy trainY: y 
	"comment stating purpose of message"
	| mses lastCoef |
	lastCoef := Array new: xTx numberOfRows withAll: 0.
	mses := alphaPath collect: [ :alpha | | pathRes |
		pathRes := self pathInputPrecomputedxTx: xTx 
			xTy: xTy 
			output: y
			l1Penality: alpha * l1Ratio  
			l2Penalty: alpha * (1 - l1Ratio) 
			tol: tol 
			coefs: lastCoef  
			maxIter: maxIter. 
			
			
		].