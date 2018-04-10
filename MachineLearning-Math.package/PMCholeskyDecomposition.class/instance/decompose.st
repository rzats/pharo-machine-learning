private
decompose
	"Private"
	| numRows|
	numRows := matrix numberOfRows.
	
	1 to: numRows do: [:i | 
		1 to: i do: [:k | | rowSum lkk factor aki partialSum |
			i = k
				ifTrue: [
					rowSum := (1 to: k - 1) inject: 0 into: [:sum :j | | lkj |
							lkj := matrix at: k at: j.
							lkj squared + sum].
					lkk := (matrix at: k at: k) - rowSum.
					lkk := lkk sqrt.
					matrix at: k at: k put: lkk]
				ifFalse: [
					factor := matrix at: k at: k.
					aki := matrix at: i at: k.
					partialSum := (1 to: k - 1) inject: 0 into: [:sum :j | | lkj lij |
						lij := matrix at: i at: j.
						lkj := matrix at: k at: j.
						lij * lkj + sum].
					matrix at: i at: k put: aki - partialSum * factor reciprocal.
					matrix at: k at: i put: 0]]].
		
