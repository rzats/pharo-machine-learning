accessing
avg: vect
	^ (vect reduce: [ :x :y | x + y ]) / vect size