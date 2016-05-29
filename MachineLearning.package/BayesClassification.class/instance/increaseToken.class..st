training
increaseToken: tokenName class: className
	| tempDictionary |
	tempDictionary := Dictionary new.
	(tokenFrequency includesKey: tokenName)
		ifTrue: [ ((tokenFrequency at: tokenName) includesKey: className)
				ifTrue: [ (tokenFrequency at: tokenName)
						at: className
						put: ((tokenFrequency at: tokenName) at: className) + 1 ]
				ifFalse: [ 
					(tokenFrequency at: tokenName) at: className put: 1 ] ]
		ifFalse: [ tempDictionary at: className put: 1.
			tokenFrequency at: tokenName put: tempDictionary ]