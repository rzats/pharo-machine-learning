training
train: text class: className
	self increaseClass: className.
	text ifNotNil: [
	(self tokenize: text) do: [ :value | self increaseToken: value class: className ]
	]