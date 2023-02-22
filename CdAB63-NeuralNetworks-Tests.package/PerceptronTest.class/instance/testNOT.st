instance creation
testNOT 

	| p |
	
	p := Neuron weights: #(-1) bias: 0.5 learningRate: 0.1 activationFunction: StepAF new.
	
	self assert: (p feed: #(1)) equals: 0.
	self assert: (p feed: #(0)) equals: 1.