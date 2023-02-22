evaluation
derivative: output

	^ output < 0
			ifTrue: [ 0 ]
			ifFalse: [ self rate ]