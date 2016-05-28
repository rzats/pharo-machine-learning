classification
classify: text
	| documentCount classes tokens scores score |
	documentCount := self getDocCount.
	classes := self getClasses.
	tokens := self tokenize: text.
	scores := Dictionary new.
	classes
		do: [ :class | 
			score := 1.
			tokens do: [ :token | score := score * (self getTokenProb: token class: class) ].
			scores at: class put: score ].
	^ scores