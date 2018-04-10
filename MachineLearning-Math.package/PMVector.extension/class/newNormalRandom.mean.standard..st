*MachineLearning-Math
newNormalRandom: size mean: mean standard: sigma
	"Answer an instance of me, with number of elements equal to size, each 
	a randomNumber lower than maxRandomNumber ."
	| rand |
	rand := PMNormalDistribution new: mean sigma: sigma.
	^self newFrom:  ( (1 to: size ) collect: [:e| rand random ]  )