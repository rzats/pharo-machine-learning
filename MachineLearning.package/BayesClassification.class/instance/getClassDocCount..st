getters
getClassDocCount: className
	^ classFrequency at: className ifPresent: [ ^classFrequency at: className ]  ifAbsent: [ ^nil ]