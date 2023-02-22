operations
feed: inputs
	"apply inputs to the neuron"	
			
	| z |
	z := (inputs asOrderedCollection with: self weights collect: [ :x :w | x * w ]) sum + bias.
	self output: (self activationFunction eval: z).
	^ self output