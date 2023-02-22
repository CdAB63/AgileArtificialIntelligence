initialization
initializeNbOfNeurons: nbOfNeurons nbOfWeights: nbOfWeights using: random

	| n |
	
	n := self new.
	n initializeNbOfNeurons: nbOfNeurons nbOfWeights: nbOfWeights using: random.
	^ n