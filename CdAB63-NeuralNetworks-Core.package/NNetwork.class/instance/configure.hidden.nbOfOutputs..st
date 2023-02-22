initialization
configure: nbOfInputs hidden: nbOfNeurons nbOfOutputs: nbOfOutputs

	| random |
	
	random := Random seed: 42.
	
	self addLayer: (NeuronLayer initializeNbOfNeurons: nbOfNeurons nbOfWeights: nbOfInputs using: random).
	self addLayer: (NeuronLayer initializeNbOfNeurons: nbOfOutputs nbOfWeights: nbOfNeurons using: random).