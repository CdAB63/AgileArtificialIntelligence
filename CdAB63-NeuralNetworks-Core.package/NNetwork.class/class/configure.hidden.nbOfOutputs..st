initialization
configure: nbOfInputs hidden: nbOfNeurons nbOfOutputs: nbOfOutputs

	| nn |
	
	nn := self new.
	nn configure: nbOfInputs hidden: nbOfNeurons nbOfOutputs: nbOfOutputs.
	^ nn