asserting
testStraightLineZero
	"straight line with little alpha"
	x := PMMatrix rows: { { 0 } .{ 0 } . { 0 } }.
	y := { 0 . 0 . 0 } asPMVector.
	predict := PMMatrix rows:{ { 1 } . {  2 }. { 3 } }.
	model := LassoModel createWithAlpha: 1e-8 maxIter: 100 
										tol: 1e-4 selection: 'cyclic'  
										normalize: false center: true.
	model fit: x to: y checkInput: true.
	res := model predict: predict.
	self assert: (model coefs at: 1) almostEquals: 0.
	self assertCollection: res almostEquals: { 0. 0. 0 }.
	self assert: model gap almostEquals: 0.