operations
predict: inputs

	| outputs |
	
	outputs := self feed: inputs.
	^ (outputs indexOf: (outputs max)) - 1