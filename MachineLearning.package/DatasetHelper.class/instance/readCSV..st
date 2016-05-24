as yet unclassified
readCSV: fileName
	Array
		streamContents: [ :out | 
			fileName asFileReference
				readStreamDo: [ :in | 
					(NeoCSVReader on: (ZnBufferedReadStream on: in))
						in: [ :reader | 
							reader separator: $,.
							reader skipHeader.
							columns
								valuesDo: [ :value | 
									"TODO: make this look less ugly. Does Smalltalk have a switch-case statement?"
									value = #integerField
										ifTrue: [ reader addIntegerField ]
										ifFalse: [ value = #floatField
												ifTrue: [ reader addFloatField ]
												ifFalse: [ value = #dateField
														ifTrue: [ reader addFieldConverter: [ :string | Date fromString: string ] ] ] ] ].
							reader do: [ :each | dataset add: each ] ] ] ]