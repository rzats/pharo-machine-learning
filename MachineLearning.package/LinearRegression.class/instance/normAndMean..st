helperMethods
normAndMean: array
	"comment stating purpose of message"

	| error mean|
	error:= 0.
	mean := 0.0.
	array do: [ :each | 
		error := error + (each * each). 
		mean := mean + each 
		].
	mean := mean /  array size.
	^{error. mean}