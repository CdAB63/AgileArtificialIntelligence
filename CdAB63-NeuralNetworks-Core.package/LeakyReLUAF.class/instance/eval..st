evaluation
eval: z

	^ z < 0
			ifTrue: [ z * self rateNeg ]
			ifFalse: [ z * self ratePos ]