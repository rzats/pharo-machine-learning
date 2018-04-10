configuration
fit: x to: y checkInput: check
	"used to start fitting elastic model"
	| preprocessXRes preprocessYRes l1Penalty l2Penalty pathRes|

	preprocessXRes := self preprocessInput: x center: (check and: center) normalize: normalize.
	preprocessYRes := self preprocessOutput: y center: (check and: center).
	xScale := preprocessXRes xScale.
	xOffset := preprocessXRes xOffset.
	yOffset := preprocessYRes yOffset.
	l1Penalty := alpha * l1Ratio * x numberOfRows.
	l2Penalty := alpha * (1 - l1Ratio ) * x numberOfRows.
	pathRes := self pathInput: preprocessXRes x inputTransposed: preprocessXRes xT 
			output: preprocessYRes y l1Penality: l1Penalty  l2Penalty: l2Penalty  
			tol: tol coefs: (Array new: x numberOfColumns withAll: 0)
			maxIter: maxIter. 
	coefs := pathRes coefs.
	gap := pathRes gap.
	nIters := pathRes iters.
	self fitIntercept.
	^ self.
	
	
	
	
	
	
