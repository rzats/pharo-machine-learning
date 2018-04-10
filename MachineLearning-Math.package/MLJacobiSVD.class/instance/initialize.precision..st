initialization
initialize: aMatrix precision: eps
	| isTransposed matrix |
	
	aMatrix numberOfRows < aMatrix numberOfColumns
		ifTrue: [ isTransposed := true.
			matrix := aMatrix transpose ]
		ifFalse: [ isTransposed := false.
			matrix := aMatrix ].
		
	self performSVD: matrix precision: eps.
	self separateUTandS.
	u := uT transpose.
	uT := nil.
	
	isTransposed
		ifTrue: [ | temp |
			temp := u.
			u := v.
			v := temp ]