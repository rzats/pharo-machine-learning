accessing
normalize: vect
	"divide by l2 norm and return it"

	| norm |
	"norm := vect inject: 0 into: [ :sum :el | sum + el squared ]. '"
	norm := vect norm.
	norm = 0 ifTrue: [ 
		norm := 1.
		 ].
		
	vect doWithIndex: [ :el :i | vect at: i put: el / norm ].
	^ norm.