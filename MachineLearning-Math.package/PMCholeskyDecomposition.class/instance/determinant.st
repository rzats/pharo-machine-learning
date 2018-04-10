operations
determinant
	| n |
	exists isNil
		ifTrue: [ self protectedDecomposition ].
	exists 
		ifFalse: [ ^ 0 ].	"Singular matrix has 0 determinant"
	n := 0.
	^ (matrix reduce: [ :det :each | n := n + 1. ( each at: n) * det ]) squared.