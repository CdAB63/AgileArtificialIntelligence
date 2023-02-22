initialization
initializeNbOfNeurons: nbOfNeurons nbOfWeights: nbOfWeights learningRate: aLearningRate activationFunction: activationFunction using: random

	| n |
	
	n := self new.
	n initializeNbOfNeurons: nbOfNeurons 
		nbOfWeights: nbOfWeights 
		learningRate: aLearningRate 
		activationFunction: activationFunction 
		using: random.
	^ n