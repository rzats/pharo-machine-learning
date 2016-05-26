creation
createFrom: helper features: features output: output ridge: rCoef stepSize: stepSize maxIter: maxIters
	"comment stating purpose of message"

	| matrix result tempCoefs iters dataset prediction errors size derivative derTemp|
	dataset := helper dataset.
	size := features size + 1.
	tempCoefs := DhbVector newFrom: (Array new: size withAll: 0).
	iters := 0.
	result := DhbVector newFrom: (dataset collect: [ :each | each at: (helper indexOfName: output) ]).
	matrix := self matrixFrom: helper features: features.
	[ iters < maxIters] whileTrue:  [ 
		prediction := matrix * tempCoefs.
		errors := prediction - result.
		derivative := errors * matrix.
		1 to: size do: [ :n |
			derTemp:= 2 * derivative at: n.
			(n = 1) ifFalse: [ 
				derTemp:= derTemp + (2.0 * rCoef * (tempCoefs at: n)) asFloat
				 ].
			   tempCoefs at: n put: ((tempCoefs at: n) asFloat - (stepSize * derTemp) asFloat ).
			 ].
		
		iters := iters + 1.
			
			
	 ].
    coefs at: #intercept put: (tempCoefs at: 1).
    (2 to: size) do: [ :n |
		coefs at: (features at: n - 1) put: (tempCoefs at: n). 
	  ].
	^self.