getters
getFrequency: token class: className
	tokenFrequency
		at: token
		ifPresent: [ (tokenFrequency at: token)
				at: className
				ifPresent: [ ^ (tokenFrequency at: token) at: className ]
				ifAbsent: [ ^ defaultProbability  ] ]
		ifAbsent: [ ^ nil ]