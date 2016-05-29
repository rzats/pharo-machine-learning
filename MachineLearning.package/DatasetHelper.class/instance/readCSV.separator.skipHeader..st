reading
readCSV: fileName separator: separator skipHeader: skip
	fileName asFileReference
		readStreamDo: [ :in | 
			(NeoCSVReader on: (ZnBufferedReadStream on: in))
				in: [ :reader | 
					reader separator: separator.
					reader skipHeader.
					columns
						valuesDo: [ :value | 
							value = #integerField
								ifTrue: [ reader addIntegerField ]
								ifFalse: [ value = #floatField
										ifTrue: [ reader addFloatField ]
										ifFalse: [ value = #dateField
												ifTrue: [ reader addFieldConverter: [ :string | Date fromString: string ] ]
												ifFalse: [ reader addField ] ] ] ].
					"TODO: make this look less ugly. Does Smalltalk have a switch-case statement?"
					reader do: [ :each | dataset add: each ] ] ]