helpers
initialize

	super initialize.

	alphas := nil.
	epsilon := 1e-3.
	l1Ratios := {0.95 . 0.9 . 0.5 . 0.1 . 0.05}.
	maxIter := 1000.
	minAlpha := nil.
	minL1 := nil.
	minMse := nil.
	mses := nil.
	nAlphas := 100.
	selection := 'cyclic'.
	tol := 1e-4.