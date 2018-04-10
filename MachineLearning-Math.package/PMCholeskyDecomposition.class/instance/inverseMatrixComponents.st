operations
inverseMatrixComponents
	| n inverseRows column |
	exists isNil
		ifTrue: [ self protectedDecomposition].
	exists
		ifFalse: [ ^ nil].	"Singular matrix has no inverse"
	n := matrix numberOfRows.
	inverseRows := (1 to: n) asPMVector collect: [ :j | PMVector new: n].
	1 to: n do:
		[ :j |
		  column := self solve: ( ( Array new: matrix size) atAllPut: 0; at: j put: 1; yourself).
		  column ifNil: [^nil].	"Singular matrix has no inverse"
		  1 to: n do: [ :i | ( inverseRows at: i) at: j put: ( column at: i)].
		]. 
	^inverseRows