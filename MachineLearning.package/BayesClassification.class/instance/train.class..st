training
train: text class: className
	self increaseClass: className.
	(self tokenize: text) do: [ :value | self increaseToken: value class: className ]