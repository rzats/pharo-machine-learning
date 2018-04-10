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
	method ~= 'svd' ifTrue: [ 
		colAm > rowAm ifTrue: [ 
			| kernelMatrix dualCoef |
			kernelMatrix := preprocessXRes x * preprocessXRes xT.
			dualCoef := self solveKernelAsCholesky: kernelMatrix 
				output:preprocessYRes y 
				alpha: tempalpha.
				
			coefs := dualCoef ifNotNil: [ preprocessXRes xT * dualCoef ] ifNil: [ nil ].
		 ] ifFalse: [ 
			coefs :=
				self solveAsCholesky: preprocessXRes x 
						inputT: preprocessXRes xT 
						output: preprocessYRes y
						alpha: tempalpha.  
		 	].
		
		 ].
	
	(coefs isNil or: method = 'svd') ifTrue: [ 
			coefs := self solveAsSvd: preprocessXRes x output: preprocessYRes y alpha: tempalpha.
		].
	self fitIntercept.
	^ self.
	
	
	
	
	
	
