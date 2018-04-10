initialization
separateUTandS
	| prevNorm |
	prevNorm := -1.
	first := uT numberOfRows + 1.
	uT rows doWithIndex: [ :row :i | 
			| norm |
			norm := row norm.
			(norm = 0 or: [ prevNorm = 0 or: [ i > 1 and: norm <= (tol * prevNorm) ] ]) ifTrue: [ 
				row scaleBy: 0.
				prevNorm := 0.
				s at: i put: 0.
				first := first min: i.
				 ] ifFalse: [
				row scaleBy: norm reciprocal.
				s at: i put: norm.
				prevNorm := norm.
				 ].
			].
	