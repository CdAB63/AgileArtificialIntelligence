accessing
activationFunction: anActivationFunction

	self assert: [ self neurons notEmpty ] description: 'activationFunction should be invoked after configuring the layer'.
	self neurons do: [ :n | n activationFunction: anActivationFunction ].