helpers
predictX: x coefs: inCoefs xScale: xScale xOffset: xOffset yOffset: yOffset 
	| coefs intercept res |
	coefs := inCoefs / xScale.
	intercept := yOffset - (coefs * xOffset).
	res := x * coefs.
	res doWithIndex: [ :el :j | res at: j put: el + intercept  ].
	^ res