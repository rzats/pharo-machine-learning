accessing
preprocessOutput: vect
	"divide by scale and return it"
	center ifTrue: [ 
		yOffset := self center: vect.
	] ifFalse: [ 
		yOffset := 0.
	 ].
	
	