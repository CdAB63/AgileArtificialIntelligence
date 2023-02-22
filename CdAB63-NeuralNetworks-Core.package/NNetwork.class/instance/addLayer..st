initialization
addLayer: aNeuronLayer

	self layers ifNotEmpty: [ 
		aNeuronLayer previousLayer: self layers last.
		self layers last nextLayer: aNeuronLayer ].
	self layers add: aNeuronLayer