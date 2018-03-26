as yet unclassified
fit: X to: y checkInput: check
	"used to start fitting elastic model"
	| processX |
	check ifTrue: [ 
		processX := self preprocessInput: X.
		self preprocessOutput: y.
		 ].
	
	self elasticNetPathInput: processX output: y.
	self fitIntercept.
	^ self.
	
	
	
	
	
	

	