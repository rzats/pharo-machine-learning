helpers
mseForPredicted: prediction withActual: y
	^ ((prediction - y) inject: 0 into: [ :sum :el | sum + el squared ]) / y size.