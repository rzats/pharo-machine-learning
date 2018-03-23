accessing
normalize: vect
	"divide by l2 norm and return it"

	| norm |
	norm := vect norm.
	
		
	vect doWithIndex: [ :el :i | vect at: i put: el / norm ].
	^ norm.