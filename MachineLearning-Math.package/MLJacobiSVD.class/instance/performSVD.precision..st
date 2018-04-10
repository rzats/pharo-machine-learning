accessing
performSVD: x precision: eps
	| maxSteps |
	uT := x transpose.
	step := 0.
	m := x numberOfRows.
	n := x numberOfColumns.
	maxSteps := 5 * n max: 12.
	step := 1.
	count := 1.
	v := PMMatrix rows: (PMSymmetricMatrix identity: n) rows.
	s := x columnsCollect: [ :col | col norm * eps ].
	tol := 10 * eps * m.
	
	[ count > 0 and: step <= maxSteps ]
		whileTrue: [ 
			step := step + 1.
			count := n * (n - 1) / 2.
			1 to: n - 1 do: [ :k | 
				k + 1 to: n do: [ :j | 
					| angle |
					angle := self evaluateRotateAngleK: k j: j.
					
					angle ifNotNil: [ 
						self rotateAngle: angle k: k j: j.
						 ] ifNil: [ 
						count := count - 1.
						 ] ] ] ]
					
					