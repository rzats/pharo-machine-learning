accessing
preprocessOutput: inVect
	"divide by scale and return it"
	| vect |
	vect := inVect copy asVector. 
	center ifTrue: [ 
		yOffset := self center: vect.
	] ifFalse: [ 
		yOffset := 0.
	 ].
	
	^vect.