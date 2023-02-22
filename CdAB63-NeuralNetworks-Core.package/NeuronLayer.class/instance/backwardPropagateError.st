operations
backwardPropagateError
	
	self neurons doWithIndex: [ :neuron :j |
		| theError |
		theError := 0.0.
		self nextLayer neurons do: [ :nextNeuron |
			theError := theError + ((nextNeuron weights at: j) * nextNeuron delta) ].
		neuron adjustDeltaWith: theError ].
	self previousLayer ifNotNil: [ 
		self previousLayer backwardPropagateError ]