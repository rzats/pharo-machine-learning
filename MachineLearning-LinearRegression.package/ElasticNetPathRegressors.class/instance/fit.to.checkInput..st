initialization
fit: x to: y checkInput: check 
	"used to start fitting elastic model"
	| preprocessXRes preprocessYRes |

	preprocessXRes := self preprocessInput: x center: (check and: center) normalize: normalize.
	preprocessYRes := self preprocessOutput: y center: (check and: center).
	xScale := preprocessXRes xScale.
	xOffset := preprocessXRes xOffset.
	yOffset := preprocessYRes yOffset.