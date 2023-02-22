operations
feed: inputs
	"apply inputs to the neuron"	
			
	| z |
	z := (inputs asOrderedCollection with: self weights collect: [ :x :w | x * w ]) sum + bias.
	^ z > 0
			ifTrue: [ 1 ]
			ifFalse: [ 0 ]