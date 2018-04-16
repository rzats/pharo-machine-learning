helpers
generateAlphaGridWithEps: eps xTy: xTy l1Ratio: l1Ratio nSamples: nSamples
	"works only for single output"
	| maxAlpha logSpaceStart logSpaceStop step |
	
	l1Ratio = 0 ifTrue: [ 
		^ nil.
		 ].
	
	
	maxAlpha := (xTy reduce: [ :a :b |
		a abs max: b abs.
		 ]) / (nSamples * l1Ratio). 
	
	"unsure here"
	maxAlpha <= Float epsilon ifTrue: [ 
		^ Array new: nAlphas withAll: Float epsilon.
		 ].

	logSpaceStart := (maxAlpha * eps) log: 10.
	logSpaceStop := maxAlpha log: 10.
	step := (logSpaceStop - logSpaceStart) / (nAlphas - 1).
	^ (logSpaceStop  to: logSpaceStart  by: step negate) collect: [ :i |
		10 ** i.
		 ].
  