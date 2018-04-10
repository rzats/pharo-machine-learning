asserting
assert: actual almostEquals: expected 
	"check for double values with precision"
	^ self assert: actual almostEquals: expected eps: 1e-6.

	
	
