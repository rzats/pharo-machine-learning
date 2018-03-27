initialization
initialize

	super initialize.

	center := true.
	coefs := nil.
	intercept := nil.
	normalize := false.
	preprocess := PreprocessDataHelper new.
	xOffset := nil.
	xScale := nil.
	yOffset := nil.