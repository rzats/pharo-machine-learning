enumerating
collect: block
	^ (1 to: size) collect: [ :i | | trainInput trainOutput testInput testOutput |
		trainInput := self trainInputWithout: i.
		trainOutput := self trainOutputWithout: i.
		testInput := self testInputWithout: i.
		testOutput := self testOutputWithout: i.
		block value: trainInput value: trainOutput value: testInput value: testOutput.
		 ].