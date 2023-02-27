examples
learningCurveEffectExample

	| g d learningCurveNeuron r p res |
	
	g := RTGrapher new.
	
	#(0.001 0.01 0.1 0.2 0.3)
		doWithIndex: [ :lr :index |
			learningCurveNeuron := OrderedCollection new.
			0 to: 1000 do: [ :nbOfTrained |
				r := Random seed: 42.
				p := Neuron weights: #(-1 -1) bias: 3 learningRate: lr.
				nbOfTrained timesRepeat: [ 
					p train: #(0 0) desiredOutput: 0.
					p train: #(0 1) desiredOutput: 0.
					p train: #(1 0) desiredOutput: 0.
					p train: #(1 1) desiredOutput: 1. ].
				res := ((p feed: #(0 0)) - 0) abs + ((p feed: #(0 1)) - 0) abs +
					    ((p feed: #(1 0)) - 0) abs + ((p feed: #(1 1)) - 1) abs.
				learningCurveNeuron add: res / 4 ].
			d := RTData new.
			d label: 'Sigmoid neuron lr = ', lr asString.
			d noDot.
			d connectColor: (RTPalette c1 at: index).
			d points: learningCurveNeuron.
			d y: #yourself.
			g add: d  ].
		g open
			