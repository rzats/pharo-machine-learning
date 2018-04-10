printing
printOn: aStream
	
	| delimitingString |
	matrix rows do:
		[ :row |
		  delimitingString := '('.
		  row do:
			[ :each |
				aStream nextPutAll: delimitingString.
				each printOn: aStream.
				delimitingString := ' ' ].
		  aStream nextPut: $).
		]
		separatedBy: [ aStream cr ]