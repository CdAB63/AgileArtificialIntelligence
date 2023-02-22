initialization
initializeNbOfNeurons: nbOfNeurons nbOfWeights: nbOfWeights leariningRate: aLearningRate using: random

	| n |
	
	n := self new.
	n initializeNbOfNeurons: nbOfNeurons nbOfWeights: nbOfWeights leariningRate: aLearningRate using: random.
	^ n