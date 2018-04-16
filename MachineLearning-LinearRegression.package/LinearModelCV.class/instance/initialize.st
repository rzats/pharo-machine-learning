initialization
initialize

	super initialize.

	center := true.
	cv := KFoldSeparator new.
	cvResults := nil.
	model := nil.
	normalize := false.