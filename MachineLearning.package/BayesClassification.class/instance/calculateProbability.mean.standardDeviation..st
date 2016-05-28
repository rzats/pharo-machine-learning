mathematical functions
calculateProbability: x mean: mean standardDeviation: stdDev
	"Estimate the probability of a given attribute value using the Gaussian probability density function."

	| exponent |
	exponent := (-1 * (x - mean raisedTo: 2) / (2 * (stdDev raisedTo: 2))) exp.
	^ 1 / ((2 * Float pi) sqrt * stdDev) * exponent