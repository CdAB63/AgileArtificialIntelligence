initialization
configure: nbOfInputs hidden: nbOfNeurons1 hidden: nbOfNeurons2 nbOfOutputs: nbOfOutputs

	| random |
	
	random := Random seed: 42.
	
	self addLayer: (NeuronLayer initializeNbOfNeurons: nbOfNeurons1 nbOfWeights: nbOfInputs using: random).
	self addLayer: (NeuronLayer initializeNbOfNeurons: nbOfNeurons2 nbOfWeights: nbOfNeurons1 using: random).
	self addLayer: (NeuronLayer initializeNbOfNeurons: nbOfOutputs nbOfWeights: nbOfNeurons2 using: random).