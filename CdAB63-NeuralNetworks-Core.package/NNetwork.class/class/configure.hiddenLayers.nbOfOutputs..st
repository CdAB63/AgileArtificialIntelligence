initialization
configure: nbOfInputs hiddenLayers: nbOfNeurons nbOfOutputs: nbOfOutputs

	| nn |
	
	nn := self new.
	nn configure: nbOfInputs hiddenLayers: nbOfNeurons nbOfOutputs: nbOfOutputs.
	^ nn