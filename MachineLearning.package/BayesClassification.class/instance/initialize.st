class initialization
initialize
	super initialize.
	defaultProbability := 0.00000000001.
	classFrequency := Dictionary new.
	tokenFrequency := Dictionary new