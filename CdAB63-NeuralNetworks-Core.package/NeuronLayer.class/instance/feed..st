operations
feed: someInputValues

	| someOutputs |
	
	someOutputs := self neurons collect: [ :n | n feed: someInputValues ] as: Array.
	^ self isOutputLayer 
			ifTrue: [ someOutputs ]
			ifFalse: [ nextLayer feed: someOutputs ]