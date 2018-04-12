tests
testPrecomputedStraightLineSmallAlphaInterceptCorrect
	"straight line with little alpha"
	x := PMMatrix rows: { { -1 } .{ 0 } . { 1 } }.
	y := { 2 . 3 . 4 } asPMVector.
	predict := PMMatrix rows:{ { 2 } . {  3 }. { 4 } }.
	model := ElasticNetModel createWithAlpha: 1e-8 maxIter: 100 
										tol: 1e-4 selection: 'cyclic'  
										l1Ratio: 1 normalize: false center: true.
	model precomputed: true.
	model fit: x to: y checkInput: true.
	res := model predict: predict.
	self assert: (model coefs at: 1) almostEquals: 1.0.
	self assertCollection: res almostEquals: { 5. 6. 7 }.
	self assert: model gap almostEquals: 0.
	self assert: model intercept almostEquals: 3.