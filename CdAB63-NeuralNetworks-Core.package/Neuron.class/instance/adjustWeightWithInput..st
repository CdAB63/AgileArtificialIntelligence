operations
adjustWeightWithInput: inputs

	inputs withIndexDo: [ :anInput :index |
		self weights at: index put: ((self weights at: index) + (self learningRate * self delta * anInput)) ]