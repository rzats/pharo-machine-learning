helperMethods
getStepFrom: errors derivative: der
	"comment stating purpose of message"

	| error derSum |
	
	error := self squareSum: errors.
	derSum := self squareSum: der.
 	^error / derSum.