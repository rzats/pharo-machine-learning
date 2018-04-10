private
forwardSubstitution: anArray
	"Private"
	| n sum answer|
	answer := Array new: anArray size.
	n := matrix numberOfRows.
	1 to: n do:
		[ :i |
		  sum := anArray at: i.
		  1 to: (i - 1) do: [ :j | sum := sum - ((matrix at: i at: j) * (answer at: j))].
		  answer at: i put: sum / (matrix at: i at: i).
		].
	^answer