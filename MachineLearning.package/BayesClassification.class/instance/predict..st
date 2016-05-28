classification
predict: text
	| scores prediction maxScore |
	scores := self classify: text.
	maxScore := 0.
	scores
		keysAndValuesDo: [ :key :value | 
			maxScore < value
				ifTrue: [ maxScore :=value.prediction := key ] ].
	^ prediction