initialization
initializeNbOfNeurons: nbOfNeurons nbOfWeights: nbOfWeights activationFunction: activationFunction using: random

	| n |
	
	n := self new.
	n initializeNbOfNeurons: nbOfNeurons nbOfWeights: nbOfWeights activationFunction: activationFunction using: random.
	^ n