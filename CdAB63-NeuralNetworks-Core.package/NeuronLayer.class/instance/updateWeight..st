operations
updateWeight: initialInputs

	| inputs |
	
	inputs := initialInputs.
	
	self neurons do: [ :n |
		n adjustWeightWithInput: inputs.
		n adjustBias ].
	
	self nextLayer ifNotNil: [ self nextLayer updateWeight ]