accessing
sFullForm
	| zero |
	zero := PMSymmetricMatrix identity: s size.
	zero setDiagonal: s.
	^ zero.