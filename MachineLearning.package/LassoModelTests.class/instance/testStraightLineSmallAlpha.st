asserting
testStraightLineSmallAlpha
	"straight line with little alpha"
	x := DhbMatrix rows: { { -1 } .{ 0 } . { 1 } }.
	y := { -1 . 0 . 1 } asVector.
	predict := DhbMatrix rows:{ { 2 } . {  3 }. { 4 } }.
	model := LassoModel createWithAlpha: 1e-8 maxIter: 100 
										tol: 1e-4 selection: 'cyclic'  
										normalize: false center: true.
	model fit: x to: y checkInput: true.
	res := model predict: predict.
	self assert: (model coefs at: 1) almostEquals: 1.0.
	self assertCollection: res almostEquals: { 2. 3. 4 }.
	self assert: model gap almostEquals: 0.