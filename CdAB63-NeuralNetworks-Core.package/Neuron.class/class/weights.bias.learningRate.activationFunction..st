instance creation
weights: someWeights bias: aBias learningRate: aLearningRate activationFunction: anActivationFunction

	| n |
	
	n := self new.
	n weights: someWeights.
	n bias: aBias.
	n learningRate: aLearningRate.
	n activationFunction: anActivationFunction.
	^ n