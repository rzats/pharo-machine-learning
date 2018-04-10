asserting
testRandomMatrices
		x := PMMatrix rows: { 
		 { 0.95008842 . -0.15135721 . -0.10321885 .  0.4105985 .  0.14404357 } .
       {  1.45427351 .  0.76103773 .  0.12167502 .  0.44386323 .  0.33367433 } .
       {  1.49407907 . -0.20515826 .  0.3130677 . -0.85409574 . -2.55298982 } .
       {  0.6536186 .  0.8644362 . -0.74216502 .  2.26975462 . -1.45436567 } .
       {  0.04575852 . -0.18718385 .  1.53277921 .  1.46935877 .  0.15494743 } .
       {  0.37816252 . -0.88778575 . -1.98079647 . -0.34791215 .  0.15634897 }
			}.
		y := { 1.76405235 . 0.40015721 .  0.97873798 .  2.2408932 .  1.86755799 .
       -0.97727788 } asPMVector.
		methods do: [ :each |
			model := BaseRidgeModel new alpha: 1; method: each.
			model fit: x to: y checkInput: true.
			score := model score: x output: y.
			self assert: score > 0.45.
		].
		
		
		x := PMMatrix randomNormalRows: 5 columns: 10.
		y := PMVector newNormalRandom: 5.
		
		
		
		methods do: [ :each |
			model method: each.
			model fit: x to: y checkInput: true.
			score := model score: x output: y.
			self assert: score > 0.9.
			
			model := BaseRidgeModel new alpha: 1; method: 'svd'.
			model fit: x to: y checkInput: true.
			score := model score: x output: y.
			self assert: score > 0.9.
		].
		 

	
	
