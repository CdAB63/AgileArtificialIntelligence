evaluation
derivative: output

	^ output < 0
			ifTrue: [ rateNeg ]
			ifFalse: [ ratePos ]