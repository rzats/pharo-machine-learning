training
increaseClass: className
	(classFrequency includesKey: className)
		ifTrue: [ classFrequency at: className put: ((classFrequency at: className) + 1)]
		ifFalse: [ classFrequency at: className put: 1 ]