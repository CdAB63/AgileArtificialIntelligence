instance creation
weights: someWeights bias: aBias learningRate: aLearningRate

	| n |
	
	n := self new.
	n weights: someWeights.
	n bias: aBias.
	n learningRate: aLearningRate.
	^ n