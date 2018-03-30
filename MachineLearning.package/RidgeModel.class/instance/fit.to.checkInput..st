configuration
fit: x to: y checkInput: check
	"used to start fitting elastic model"
	| preprocessXRes preprocessYRes colAm rowAm|

	preprocessXRes := self preprocessInput: x center: (check and: center) normalize: normalize.
	preprocessYRes := self preprocessOutput: y center: (check and: center).
	xScale := preprocessXRes xScale.
	xOffset := preprocessXRes xOffset.
	yOffset := preprocessYRes yOffset.
	
	colAm := x numberOfColumns.
	rowAm := x numberOfRows.
	colAm > rowAm ifTrue: [ 
		| kernelMatrix dualCoef |
		kernelMatrix := preprocessXRes x * preprocessXRes xT.
		1 to: kernelMatrix numberOfRows do: [ :i |
			kernelMatrix at: i at: i put: (kernelMatrix at: i at: i) + alpha.
			 ].
		dualCoef := kernelMatrix lupDecomposition solve: preprocessYRes y.
		coefs := preprocessXRes xT * dualCoef.
		 ] ifFalse: [ 
		| a xy |
		a := preprocessXRes xT * preprocessXRes x.
		1 to: a numberOfRows do: [ :i |
			a at: i at: i put: (a at: i at: i) + alpha.
			 ].
		xy := preprocessXRes xT * preprocessYRes y.
		coefs := a lupDecomposition solve: xy.
		 ].
	
	self fitIntercept.
	^ self.
	
	
	
	
	
	
