initialization
initialize 

	super initialize.
	self nextLayer: nil.
	self previousLayer: nil.
	self neurons: OrderedCollection new.