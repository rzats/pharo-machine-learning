configuration
fit: x to: y checkInput: check
	"used to start fitting elastic model"
	| preprocessXRes preprocessYRes colAm rowAm |

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
		coefs := dualCoef ifNotNil: [ preprocessXRes xT * dualCoef ] ifNil: [ nil ].
		 ] ifFalse: [ 
			coefs :=
			self solveAsLUP: preprocessXRes x 
					inputT: preprocessXRes xT 
					output: preprocessYRes y.  
		 ].
	
	coefs isNil ifTrue: [ 
			coefs := self solveAsSvd: preprocessXRes x output: preprocessYRes y.
		].
	self fitIntercept.
	^ self.
	
	
	
	
	
	
