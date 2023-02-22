accessing
learningRate: aLearningRate

	self assert: [ self neurons notEmpty ] description: 'learningRate should be invoked after configuring the layer'.
	self neurons do: [ :n | n learningRate: aLearningRate ].