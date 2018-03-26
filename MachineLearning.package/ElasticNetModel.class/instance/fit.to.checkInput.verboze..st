as yet unclassified
fit: X to: y checkInput: check verboze: isVerbose 
	"used to start fitting elastic model"
	check ifTrue: [ 
		self preprocessInput: X.
		self preprocessOutput: y.
		 ].
	
	self elasticNetPathInput: X output: y.
	
	
	^self.
	
	
	

	