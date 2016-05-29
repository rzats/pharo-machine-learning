helperMethods
mean: array
	"comment stating purpose of message"

	| mean|
	mean := 0.0.
	array do: [ :each | 
		mean := mean + each 
		].
	mean := mean /  array size.
	^mean