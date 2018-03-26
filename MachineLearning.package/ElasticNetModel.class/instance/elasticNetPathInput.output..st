as yet unclassified
elasticNetPathInput: X output: y 
	^ self elasticNetPathInput: X output: y coefInit: (Array new: X numberOfColumns withAll: 0) asVector verbose: true.
	
	
	

