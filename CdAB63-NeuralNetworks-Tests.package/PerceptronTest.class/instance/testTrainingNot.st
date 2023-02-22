tests
testTrainingNot 

	| p |
	
	p := Neuron weights: #(-1) bias: 2 learningRate: 0.1 activationFunction: StepAF new.
	
	40 timesRepeat: [ 
		p train: #(0) desiredOutput: 1.
		p train: #(1) desiredOutput: 0 ].
		
	self assert: (p feed: #(0)) equals: 1.
	self assert: (p feed: #(1)) equals: 0.