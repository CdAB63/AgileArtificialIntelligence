initialization
configure: nbOfInputs hidden: nbOfNeurons1 hidden: nbOfNeurons2 nbOfOutputs: nbOfOutputs

	| nn |
	
	nn := self new.
	nn configure: nbOfInputs hidden: nbOfNeurons1 hidden: nbOfNeurons2 nbOfOutputs: nbOfOutputs.
	^ nn