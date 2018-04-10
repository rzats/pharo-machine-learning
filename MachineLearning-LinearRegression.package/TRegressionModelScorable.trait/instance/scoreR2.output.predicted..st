as yet unclassified
scoreR2: x output: y predicted: pred
	"comment stating purpose of message"
	| u v residualU residualV avg |
	residualU := y - pred.
	u := residualU * residualU.
	avg := Array new: y size withAll: y average.
	residualV := y - avg.
	v := residualV * residualV.
	^ 1 - (u / v).