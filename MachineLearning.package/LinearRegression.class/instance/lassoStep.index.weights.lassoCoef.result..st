helperMethods
lassoStep: matrix index: i weights: tempCoefs lassoCoef: lCoef result: output
	"feature_matrix[:,i] * (output  - prediction + weights[i] * feature_matrix[:,i]"

	| roI  result prediction errors hI |
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
			result := roI - (lCoef/2)
			 ].
		roI < (lCoef / (-2)) ifTrue: [ 
			result := roI + (lCoef/2)
			 ].	
	 ].
	"result := result * output size."
 	^result.