initialization
initializeNbOfNeurons: nbOfNeurons nbOfWeights: nbOfWeights activationFunction: activationFunction using: random

	| weights |
	
	self neurons: ((1 to: nbOfNeurons) collect: [ :i |
		weights := (1 to: nbOfWeights) collect: [ :ii |
			random next * 4 - 2 ].
		Neuron weights: weights bias: (random next * 4 - 2) learningRate: 0.1 activationFunction: activationFunction ] ).
	self learningRate: 0.1