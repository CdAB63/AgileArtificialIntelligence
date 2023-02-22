operations
backwardPropagateError: expected

	self neurons with: expected do: [ :neuron :exp |
		| theError |
		theError := exp - neuron output.
		neuron adjustDeltaWith: theError ].
	
	self previousLayer ifNotNil: [ 
		self previousLayer backwardPropagateError ].