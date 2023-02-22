instance creation
weights: someWeights bias: aBias

	| n |
	
	n := self new.
	n weights: someWeights.
	n bias: aBias.
	^ n