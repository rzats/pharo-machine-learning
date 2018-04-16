as yet unclassified
pathResidualsPrecomputed: alphaPath l1Ratio: l1Ratio trainxTx: txTx trainxTy: txTy y: y 
	"comment stating purpose of message"
	| mses lastCoef |
	mses := alphaPath collect: [ :alpha | | pathRes |
		pathRes := self pathInputPrecomputedxTx: txTx 
			xTy: txTy 
			output: y
			l1Penality: alpha * l1Ratio  
			l2Penalty: alpha * (1 - l1Ratio) 
			tol: tol 
			coefs: lastCoef  
			maxIter: maxIter. 
		].