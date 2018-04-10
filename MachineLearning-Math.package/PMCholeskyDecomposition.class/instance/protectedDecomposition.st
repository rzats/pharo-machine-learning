private
protectedDecomposition
	"Private - If decomposition fails, set permutation to 0."
	[ self decompose. 	
		exists := true.
	] on: Error do: 
		[ :signal | exists := false. signal return: nil].