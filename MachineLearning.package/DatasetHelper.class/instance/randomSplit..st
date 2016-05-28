helper methods
randomSplit: ratio
	"Split a dataset randomly into train and test datasets, with a (ratio)% of train."

	| rand trainingSize trainingSet testSet randomIndex |
	ratio > 0.0 & (ratio < 1.0)
		ifFalse: [ Error signal: 'ratio must be a float between 0.0 and 1.0' ].
	rand := Random new.
	trainingSize := (dataset size * ratio) asInteger.

	"Set trainingSet to a new collection and testSet to the initial dataset"
	trainingSet := OrderedCollection new.
	testSet := dataset copy.

	"Remove items from testSet and add them to trainingSet until a proper ratio between them is reached"
	[ trainingSet size <= trainingSize ]
		whileTrue: [ randomIndex := rand nextInt: testSet size.
			trainingSet add: (testSet removeAt: randomIndex) ].
	^ Array with: trainingSet with: testSet