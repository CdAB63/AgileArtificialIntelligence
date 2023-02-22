initialization
train: inputs desiredOutput: desiredOutput
	"train the neuron"
	
	| theError output newWeight |
	
	output := self feed: inputs.
	theError := desiredOutput - output.
	
	inputs withIndexDo: [ :anInput :index |
		newWeight := (self weights at: index) + (self learningRate * theError * anInput).
		self weights at: index put: newWeight ].
	
	bias := bias + (learningRate * theError)