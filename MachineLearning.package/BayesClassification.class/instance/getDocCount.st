getters
getDocCount
	^ classFrequency values inject: 0 into: [ :a :b | a+b ]