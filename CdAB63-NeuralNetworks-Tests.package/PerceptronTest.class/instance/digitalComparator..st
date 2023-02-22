instance creation
digitalComparator: inputs
	"return an array of three elements indicating if it is less, equal or greater"
	
	| not and nor a b aGb aEb aLb notA notB |
	
	a := inputs first.
	b := inputs second.
	
	and := Neuron weights: #(1 1) bias: -1.5 learningRate: 0.1 activationFunction: StepAF new.
	not := Neuron weights: #(-1) bias: 0.5 learningRate: 0.1 activationFunction: StepAF new.
	nor := Neuron weights: #(-1 -1) bias: 0.5 learningRate: 0.1 activationFunction: StepAF new.
	notA := not feed: { a }.
	notB := not feed: { b }.
	
	aLb := and feed: { notA . b }.
	aGb := and feed: { a . notB }.
	aEb := nor feed: { aGb . aLb }.
	^ { aGb . aEb . aLb }