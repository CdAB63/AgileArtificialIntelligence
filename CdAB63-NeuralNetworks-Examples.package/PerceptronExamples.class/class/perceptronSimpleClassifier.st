examples
perceptronSimpleClassifier

	| testPoints f g d d2 p r anX anY desiredOutput |
	
	f := [ :x | (-2 * x) -3 ].
	
	p := Neuron weights: #(1 2) bias: -1  learningRate: 0.1 activationFunction: StepAF new.
	r := Random seed: 42.
	
	500 timesRepeat: [ 
		anX := (r nextInteger: 50) - 25.
		anY := (r nextInteger: 50) - 25.
		desiredOutput := (f value: anX) >= anY
										ifTrue: [ 1 ]
										ifFalse: [ 0 ].
		p train: { anX . anY } desiredOutput: desiredOutput ].
	
	testPoints := OrderedCollection new.
	5000 timesRepeat: [ 
		testPoints add: { ((r nextInteger: 50) - 25). ((r nextInteger: 50) - 25) } ].
	
	g := RTGrapher new.
	d := RTData new.
	d dotShape color: [ :point |
		(p feed: point) > 0.5
			ifTrue: [ Color red trans ]
			ifFalse: [ Color blue trans ] ].
	d points: testPoints.
	d x: #first.
	d y: #second.
	g add: d.
	
	d2 := RTData new.
	d2 noDot connectColor: Color red.
	d2 points: (-15 to: 15 by: 0.1).
	d2 y: f.
	d2 x: #yourself.
	g add: d2.
	
	g open