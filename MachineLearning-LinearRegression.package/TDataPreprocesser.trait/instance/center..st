accessing
center: vect
	"center the vector"
	| avg |
	avg := self avg: vect.
	vect doWithIndex: [ :el :i | vect at:i put: el - avg ].
	^ avg.