helperMethods
squareSum: errors
	"comment stating purpose of message"

	| error |
	error:= 0.
	errors do: [ :each | error := error + (each * each) ].
	^error