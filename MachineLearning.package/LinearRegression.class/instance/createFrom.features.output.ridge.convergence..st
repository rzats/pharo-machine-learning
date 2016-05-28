creation
createFrom: helper features: features output: output ridge: rCoef convergence: converge
	"comment stating purpose of message"

	| matrix result tempCoefs dataset prediction errors size derivative myStepSize conv |
	dataset := helper dataset.
	iters := 0.
	size := features size + 1.
	tempCoefs := DhbVector new: size withAll: 0.0.
	conv:= converge +1.
	myStepSize := 0.
	derivative := DhbVector new: size withAll: 0.0.
	result := DhbVector newFrom: (dataset collect: [ :each | each at: (helper indexOfName: output) ]).
	matrix := self matrixFrom: helper features: features.
	[ converge  < conv] whileTrue:  [ 
	   tempCoefs := tempCoefs - (myStepSize  * derivative).
		prediction := matrix * tempCoefs.
		errors := prediction - result.
		derivative := 2*errors * matrix.
		1 to: size do: [ :n |
			n = 1 ifFalse: [ 
				derivative at: n put: ((derivative at:n) + (2.0 * rCoef * (tempCoefs at: n) asFloat))
				 ]
			 ].
		myStepSize := self getStepFrom: errors derivative: derivative. 
		
		conv := derivative norm.
	   iters := iters + 1.
	 ].

    intercept := tempCoefs at: 1.
    2 to: size do: [ :n |
		coefs at: (features at: n - 1) put: (tempCoefs at: n). 
	  ].
	 rsse := errors norm.
	 rss := errors * errors.
	^self.