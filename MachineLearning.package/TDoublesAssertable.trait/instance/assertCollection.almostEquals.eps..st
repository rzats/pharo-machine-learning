asserting
assertCollection: actual almostEquals: expected eps: eps
	"check for double values with precision"
	| check |
	check := true.
	actual doWithIndex: [ :el :j |
		check := check and: (el - (expected at: j)) abs < eps.
		 ].
	^ self assert: check.
