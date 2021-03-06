asserting
testStraightLineAlpha_1e_1
	"straight line with little alpha"
	x := PMMatrix rows: { { -1 } .{ 0 } . { 1 } }.
	y := { -1 . 0 . 1 } asPMVector.
	predict := PMMatrix rows:{ { 2 } . {  3 }. { 4 } }.
	model := LassoModel createWithAlpha: 1e-1 maxIter: 100 
										tol: 1e-4 selection: 'cyclic'  
										normalize: false center: true.
	model fit: x to: y checkInput: true.
	res := model predict: predict.
	self assert: (model coefs at: 1) almostEquals: 0.85.
	self assertCollection: res almostEquals: { 1.7 . 2.55 . 3.4 }.
	self assert: model gap almostEquals: 0.
	
