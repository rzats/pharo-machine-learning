asserting
assertCollection: actual almostEquals: expected 
	"check for double values with precision"
	^ self assertCollection: actual almostEquals: expected eps: 1e-6.

	
