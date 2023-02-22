initialization
configure: nbOfInputs hiddenLayers: nbOfNeurons activationFunctions: activationFunctions nbOfOutputs: nbOfOutputs

	| nn |
	
	nn := self new.
	nn configure: nbOfInputs hiddenLayers: nbOfNeurons activationFunctions: activationFunctions nbOfOutputs: nbOfOutputs.
	^ nn