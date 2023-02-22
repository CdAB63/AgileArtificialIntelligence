initialization
configure: nbOfInputs hiddenLayers: nbOfNeurons activationFunctions: activationFunctions nbOfOutputs: nbOfOutputs

	| random isInputLayer lastNbOfNeurons af laf |
	
	self assert: [ nbOfNeurons size = (activationFunctions size - 1) ] 
			description: 'activationFunctions must cover output layer'.
	
	af := activationFunctions asOrderedCollection.
	laf := af removeLast.
	
	random := Random seed: 42.
	isInputLayer := true.
	
	nbOfNeurons with: af do: [ :n :a | 
		isInputLayer	
			ifTrue: [
				self addLayer: (NeuronLayer initializeNbOfNeurons: n 
															 nbOfWeights: nbOfInputs 
															 activationFunction: a 
															 using: random).
				isInputLayer := false ]
			ifFalse: [
					self addLayer: (NeuronLayer initializeNbOfNeurons: n 
																 nbOfWeights: lastNbOfNeurons 
																 activationFunction: a 
																 using: random) ].
		lastNbOfNeurons := n ].
		
	self addLayer: (NeuronLayer initializeNbOfNeurons: nbOfOutputs 
												 nbOfWeights: lastNbOfNeurons 
												 activationFunction: laf 
												 using: random).