initialization
learningRate: aLearningRate
	"apply to all layers"
	self layers do: [ :l | l learningRate: aLearningRate ]