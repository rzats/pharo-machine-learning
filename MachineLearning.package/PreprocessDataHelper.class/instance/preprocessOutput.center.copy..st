accessing
preprocessOutput: inVect center: center copy: copy
	"divide by scale and return it"
	| vect |
	vect := copy
				ifTrue: [ inVect copy asVector ]
				ifFalse: [ inVect ].
	center
		ifTrue: [ | yOffset |
			yOffset := center
				ifTrue: [ self center: vect ]
				ifFalse: [ 0 ].
			^ PreprocessOutputResult createWithY: vect offset: yOffset  ]
		ifFalse: [
			^ PreprocessOutputResult createWithY: vect offset: 0.
			 ].