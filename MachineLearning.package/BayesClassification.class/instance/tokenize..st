tokenizing
tokenize: string
	^ string asLowercase 
		findTokens:
			' 
			-/;:.,<>[]{}!!@#$%^&*()?'