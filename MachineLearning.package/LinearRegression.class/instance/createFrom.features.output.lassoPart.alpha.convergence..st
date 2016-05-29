creation
createFrom: helper features: features output: output lassoPart: lCoef alpha: alpha convergence: tolerance
	"comment stating purpose of message"

	| matrix result tempCoefs dataset size oldVal maxDiff maxIters diff|
	maxIters := 5000.
	dataset := helper dataset.
	iters := 0.
	size := features size + 1.
	tempCoefs := DhbVector new: size withAll: 0.0.
	maxDiff:= tolerance +1.
	result := DhbVector newFrom: (dataset collect: [ :each | each at: (helper indexOfName: output) ]).
	matrix := self matrixNormedFrom: helper features: features.
	[ maxDiff   > tolerance and: iters < maxIters ] whileTrue:  [ 
	   
		maxDiff := 0.
		1 to: features size + 1 do: [ :i |
			oldVal := tempCoefs  at: i.
			((oldVal = 0) not or: (iters = 0) ) ifTrue: [ 
				tempCoefs 
					at: i
					put: 
						(self elasticStep: matrix index: i weights: tempCoefs lassoPart: lCoef alpha: alpha result: result).
				diff := ((tempCoefs at: i) - oldVal) abs .
				maxDiff := diff max: maxDiff
			 	].
			].
			
		
	   iters := iters + 1.
	 ].

	rsse := (result - (matrix * tempCoefs)) norm.
	 rss := (result - (matrix * tempCoefs)) * (result - (matrix * tempCoefs)).
    intercept := (tempCoefs at: 1) / (dataset size sqrt).
    2 to: size do: [ :n |
		coefs at: (features at: n - 1) put: ((tempCoefs at: n) / (norms at: n -  1)). 
		meansDict at: (features at: n - 1) put: (means at: (n - 1))
	  ].
	^self.