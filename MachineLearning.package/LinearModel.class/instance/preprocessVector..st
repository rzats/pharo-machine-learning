accessing
preprocessVector: vect
	"divide by scale and return it"
	| l2_norm |
	self center: vect.
	l2_norm := vect norm.
	vect doWithIndex: [ :el :i | vect at: i put: el / l2_norm ].