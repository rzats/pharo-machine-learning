asserting
assert: actual almostEquals: expected eps: eps
	"check for double values with precision"
	^ self assert: (actual - expected) abs < eps.

	
	
