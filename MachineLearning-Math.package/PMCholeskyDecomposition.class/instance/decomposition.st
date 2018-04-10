as yet unclassified
decomposition
	"comment stating purpose of message"

	exists ifNil: [ 
		self protectedDecomposition.
		 ].
	
	exists 
		ifFalse: [ 
			^ nil.
		 ]
		ifTrue: [
			^matrix. 
		 ].