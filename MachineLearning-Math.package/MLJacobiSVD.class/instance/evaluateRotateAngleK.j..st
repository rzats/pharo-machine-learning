accessing
evaluateRotateAngleK: k j: j
	| uk uj alpha beta gamma pp qq vv cos sin absErrK absErrJ sorted orthog noisyK noisyJ |
	uk := uT rowAt: k.
	uj := uT rowAt: j.
	"elements of A^t*A"
   alpha := uk * uk.
	beta :=  uj * uj.
	gamma := uk * uj.
	
	"some repeated formula values to evaluate angles and checks"
	pp := gamma * 2.
	qq := alpha - beta.
	vv := (pp squared + qq squared) sqrt.
	
	absErrK := s at: k.
	absErrJ := s at: j.
	noisyK := alpha sqrt < absErrK.
	noisyJ := beta sqrt < absErrJ.
	sorted := alpha >= beta.
	orthog := pp abs <= (tol * (alpha * beta) sqrt).
	
	(sorted and: (orthog or: (noisyK or: noisyJ))) ifTrue: [ 
		^ nil.
		 ].
	
	(vv = 0 or: sorted not) ifTrue: [ 
		cos := 0.
		sin := 1.
	] ifFalse: [
		cos := ((vv + qq) / (2 * vv)) sqrt.
		sin := pp / (2 * vv * cos).
	].

	^ cos @ sin.