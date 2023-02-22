operations
updateWeight
	
	| inputs |
	
	inputs := self previousLayer neurons collect: #output.
	self updateWeight: inputs