as yet unclassified
elasticNetPathInput: X output: y  verbose: isVerbose 
	^ self elasticNetPathInput: X output: y coefInit: (Array new: X numberOfColumns withAll: 0) asVector verbose: isVerbose.
	
	
	

