tests
testStraightLineHalfAlphaEqualRation
	"straight line with little alpha"
	x := DhbMatrix rows: { { -1 } .{ 0 } . { 1 } }.
	y := { -1 . 0 . 1 } asVector.
	predict := DhbMatrix rows:{ { 2 } . {  3 }. { 4 } }.
	model := ElasticNetModel createWithAlpha: 0.5 maxIter: 100 
										tol: 1e-4 selection: 'cyclic'  
										l1Ratio: 0.5 normalize: false center: true.
	model fit: x to: y checkInput: true.
	res := model predict: predict.
	self assert: (model coefs at: 1) almostEquals: 0.45454 eps: 1e-3.
	self assertCollection: res almostEquals: { 0.9090 . 1.3636 . 1.8181 } eps: 1e-3.
	self assert: model gap almostEquals: 0.