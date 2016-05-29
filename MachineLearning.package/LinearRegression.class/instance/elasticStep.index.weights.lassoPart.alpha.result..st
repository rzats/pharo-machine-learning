helperMethods
elasticStep: matrix index: i weights: tempCoefs lassoPart: lRatio alpha: alpha  result: output
	"feature_matrix[:,i] * (output  - prediction + weights[i] * feature_matrix[:,i]"

	| roI  result prediction errors hI lCoef rCoef|
	lCoef := alpha * lRatio .
	rCoef := alpha * (1 - lRatio).
	prediction := matrix * tempCoefs.
	errors := output - prediction .
	hI := DhbVector newFrom: (matrix atColumn: i).
	roI := hI * (errors + ((tempCoefs at: i) * hI)) "/ output size".
	result := 0.
	i = 1 ifTrue: [ 
		result := roI 
		 ]
	ifFalse: [ 
		roI > (lCoef /2) ifTrue: [ 
			result := roI - (lCoef/2) / (1 + rCoef)
			 ].
		roI < (lCoef / (-2)) ifTrue: [ 
			result := roI + (lCoef/2) / (1 + rCoef)
			 ].	
	 ].
	"result := result / (1 + rCoef)."
 	^result.