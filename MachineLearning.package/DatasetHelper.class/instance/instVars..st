as yet unclassified
instVars: object
	"get all named instance variables of an object"

	| fields |
	fields := (1 to: object class instSize) collect: [ :i | object instVarAt: i ].
	^fields