instance creation
testNOR 

	| p |
	
	p := Neuron weights: #(-1 -1) bias: 0.5 learningRate: 0.1 activationFunction: StepAF new.
	
	self assert: (p feed: #(0 0)) equals: 1.
	self assert: (p feed: #(0 1)) equals: 0.
	self assert: (p feed: #(1 0)) equals: 0.
	self assert: (p feed: #(1 1)) equals: 0.