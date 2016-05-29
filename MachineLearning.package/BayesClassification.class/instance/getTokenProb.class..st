getters
getTokenProb: token class: class
	| classDocumentCount tokenFreq |
	classDocumentCount := self getClassDocCount: class.
	tokenFreq := self getFrequency: token class: class.
	tokenFreq ifNil: [ ^ defaultProbability ].
	tokenFreq <= defaultProbability
		ifTrue: [ ^ tokenFreq ].
	^ tokenFreq / classDocumentCount