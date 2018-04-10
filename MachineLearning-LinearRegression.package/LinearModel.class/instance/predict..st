classification
predict: X
	| res |
	res := X * coefs.
	res doWithIndex: [ :el :j | res at: j put: el + intercept  ].
	^ res.