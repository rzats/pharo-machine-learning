accessing
solveAsSvd: x output: y
	| decomposition u v s diag sUTy j |
	decomposition := x decompose.
	u := decomposition leftSingularForm.
	v := decomposition rightSingularForm.
	s := decomposition sForm.
	"u^t * y"
	"probably can be done better"
	sUTy := y * u.
	
	j := 0.
	"diag(s[j,j]/(s[j,j]^2+alpha)) * u^t* y, if diagonal is larger than some little value 1e-15"
	sUTy rowsDo: [ :each | |sDiagVal scale|
		sDiagVal := s at: j at: j.
		scale := sDiagVal > 1e-15 ifTrue: [ 
			sDiagVal / (sDiagVal squared + alpha)
			 ] ifFalse: [ 0 ].
		each scaleBy: scale.
		j := j + 1.
		 ].
	^ v * sUTy.
	
	
	