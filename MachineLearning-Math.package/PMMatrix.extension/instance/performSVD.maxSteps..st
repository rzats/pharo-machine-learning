*MachineLearning-Math
performSVD: eps maxSteps: steps
 | u v converge n m step |
 u := self * 1.
 step := 0.
 converge := 100.
 m := u numberOfRows.
 n := u numberOfColumns.
 v := PMSymmetricMatrix identity: n.
 [ converge > 1e-6 and: step < 100 ] whileTrue: [  
	step := step + 1.
	converge := 0.
	2 to: n do: [ :j | 
		 1 to: j - 1 do: [ :k | | alpha beta gamma uk uj zeta t c s |
			uk := (u columnAt: k).
			uj := (u columnAt: j).
			alpha := (uk * uk) .
			beta :=  (uj * uj) .
			gamma := (uk * uj).
			converge := converge max: gamma abs / (alpha * beta) sqrt.
			
			gamma = 0 ifTrue: [ 
				t := 0.
				 ] ifFalse: [
				zeta := (beta - alpha) / (2 * gamma).
				t := zeta sign / (zeta abs + (1 + zeta squared) sqrt).
				].
			
		
			c := 1 / (1 + t squared) sqrt.
			s := c * t.
			
			1 to: m do: [ :l | | temp | 
				temp := u at: l at: k.
				u at: l at: k put: (c * temp - (s * (u at: l at: j))).
				u at: l at: j put: (s * temp + (c * (u at: l at: j))).
				 ].
			
			1 to: n do: [ :l | | temp | 
				temp := v at: l at: k.
				v at: l at: k put: (c * temp - (s * (v at: l at: j))).
				v at: l at: j put: (s * temp + (c * (v at: l at: j))).
				 ].
			].
		 ].
	 ].
^ u * v transpose.