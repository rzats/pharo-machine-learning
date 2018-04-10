as yet unclassified
score: x output: y 
	| prediction |
	prediction := self predict: x.
	^self scoreR2: x output: y predicted: prediction.