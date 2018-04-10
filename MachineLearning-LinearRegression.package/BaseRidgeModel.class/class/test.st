tests
test
	| rows rand res x y model |
	rows := (1 to: 100 by: 2) collect: [ :i | { i . i*i . i*i*i } asPMVector  ].
	rand := PMGaussianGenerator new.
	y := (1 to: 100 by: 2) collect: [ :i | i + i squared + (i * i * i) + (rand next) ].
	x := PMMatrix rows: rows.
	model := BaseRidgeModel new.
	model fit: x to: y checkInput: true.
	
	
	