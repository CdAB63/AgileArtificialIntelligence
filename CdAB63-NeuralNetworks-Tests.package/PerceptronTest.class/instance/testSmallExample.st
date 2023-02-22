instance creation
testSmallExample 

	| p result |
	
	p := Neuron weights: #(1 2) bias: -2 learningRate: 0.1 activationFunction: StepAF new.
	result := p feed: #(5 2).
	self assert: result equals: 1.