examples
learningCurveComparison

	| learningCurveNeuron learningCurvePerceptron p res g d |
	
	learningCurveNeuron := OrderedCollection new.
	
	0 to: 1000 do: [ :nbOfTrained |
		p := Neuron weights: #(-1 -1) bias: 2 learningRate: 0.1 activationFunction: SigmoidAF new.
		nbOfTrained timesRepeat: [ 
			p train: #(0 0) desiredOutput: 0.
			p train: #(0 1) desiredOutput: 0.
			p train: #(1 0) desiredOutput: 0.
			p train: #(1 1) desiredOutput: 1 ].
		res := ((p feed: #(0 0)) - 0) abs +
				  ((p feed: #(0 1)) - 0) abs +
				  ((p feed: #(1 0)) - 0) abs +
				  ((p feed: #(1 1)) - 1) abs.
		learningCurveNeuron add: res / 4 ].
	
	learningCurvePerceptron := OrderedCollection new.
	
	0 to: 1000 do: [ :nbOfTrained |
		p := Neuron weights: #(-1 -1) bias: 2 learningRate: 0.1 activationFunction: StepAF new.
		
		nbOfTrained timesRepeat: [ 
			p train: #(0 0) desiredOutput: 0.
			p train: #(0 1) desiredOutput: 0.
			p train: #(1 0) desiredOutput: 0.
			p train: #(1 1) desiredOutput: 1 ].
		
		res := ((p feed: #(0 0)) - 0) abs +
		       ((p feed: #(0 1)) - 0) abs +
				  ((p feed: #(1 0)) - 0) abs +
				  ((p feed: #(1 1)) - 1) abs.
		
		learningCurvePerceptron add: res / 4 ].
	
	g := RTGrapher new.
	d := RTData new.
	d label: 'Sigmoid Neuron'.
	d noDot connectColor: Color blue.
	d points: learningCurveNeuron.
	d y: #yourself.
	g add: d.
	
	d := RTData new.
	d label: 'Perceptron'.
	d noDot connectColor: Color green.
	d points: learningCurvePerceptron.
	d y: #yourself.
	g add: d.
	
	g axisY title: 'Error'.
	g axisX noDecimal; title: 'Epoch'.
	g legend addText: 'Perceptron vs Sigmoid Neuron Training Rates'.
	g open