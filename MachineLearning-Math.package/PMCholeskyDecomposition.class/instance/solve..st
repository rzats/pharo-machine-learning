private
solve: anArrayOrVector
	exists isNil
		ifTrue: [ self protectedDecomposition ].
	^ exists
		ifFalse: [ nil ]
		ifTrue:[ 
			[self backwardSubstitution: ( self forwardSubstitution: anArrayOrVector)] on: ZeroDivide do: [:e|  nil] ]