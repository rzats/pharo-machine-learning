enumerating
do: block
	^ 1 to: size do: [ :i | | trainInput trainOutput testInput testOutput |
		trainInput := self trainInputWithout: i.
		trainOutput := self trainOutputWithout: i.
		testInput := self testInputWithout: i.
		testOutput := self testOutputWithout: i.
		block value: trainInput value: trainOutput value: testInput value: testOutput.
		 ].