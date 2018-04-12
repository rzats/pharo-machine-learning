tests
testPrecomputedStraightLineHalfAlphaMoreL2
	"straight line with little alpha"
	x := PMMatrix rows: { { -1 } .{ 0 } . { 1 } }.
	y := { -1 . 0 . 1 } asPMVector.
	predict := PMMatrix rows:{ { 2 } . {  3 }. { 4 } }.
	model := ElasticNetModel createWithAlpha: 0.5 maxIter: 100 
										tol: 1e-4 selection: 'cyclic'  
										l1Ratio: 0.3 normalize: false center: true.
	model precomputed: true.
	
	model fit: x to: y checkInput: true.
	res := model predict: predict.
	self assert: (model coefs at: 1) almostEquals: 0.50819 eps: 1e-3.
	self assertCollection: res almostEquals: { 1.0163 . 1.5245 . 2.0327 } eps: 1e-3.
	self assert: model gap almostEquals: 0.