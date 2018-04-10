asserting
testStraightLineAlpha_5e_1
	"straight line with little alpha"
	x := PMMatrix rows: { { -1 } .{ 0 } . { 1 } }.
	y := { -1 . 0 . 1 } asPMVector.
	predict := PMMatrix rows:{ { 2 } . {  3 }. { 4 } }.
	model := LassoModel createWithAlpha: 0.5 maxIter: 100 
										tol: 1e-4 selection: 'cyclic'  
										normalize: false center: true.
	model fit: x to: y checkInput: true.
	res := model predict: predict.
	self assert: (model coefs at: 1) almostEquals: 0.25.
	self assertCollection: res almostEquals: { 0.5 . 0.75 . 1 }.
	self assert: model gap almostEquals: 0.
	
