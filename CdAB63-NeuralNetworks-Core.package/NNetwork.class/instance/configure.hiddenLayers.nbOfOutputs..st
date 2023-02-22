initialization
configure: nbOfInputs hiddenLayers: nbOfNeurons nbOfOutputs: nbOfOutputs

	| random isInputLayer lastNbOfNeurons |
	
	random := Random seed: 42.
	isInputLayer := true.
	
	nbOfNeurons do: [ :n | 
		isInputLayer	
			ifTrue: [
				self addLayer: (NeuronLayer initializeNbOfNeurons: n nbOfWeights: nbOfInputs using: random).
				lastNbOfNeurons := n.
				isInputLayer := false ]
			ifFalse: [
					self addLayer: (NeuronLayer initializeNbOfNeurons: n nbOfWeights: lastNbOfNeurons using: random).
					lastNbOfNeurons := n ] ].
		self addLayer: (NeuronLayer initializeNbOfNeurons: nbOfOutputs nbOfWeights: lastNbOfNeurons using: random).