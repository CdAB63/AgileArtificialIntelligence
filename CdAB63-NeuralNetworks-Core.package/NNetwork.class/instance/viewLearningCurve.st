operations
viewLearningCurve 

	| b ds |
	
	self errors ifEmpty: [ ^RTView new add: (RTLabel elementOn: 'Should first run the network'); yourself ].
	
	b := RTDoubleGrapher new.
	b extent: 500 @ 300.
	ds := RTData new.
	ds samplingIfMoreThan: 2000.
	ds noDot; connectColor: Color blue.
	ds points: (self errors collectWithIndex: [ :y :i | i -> y ]).
	ds x: #key.
	ds y: #value.
	ds dotShape rectangle color: Color blue.
	b add: ds.
	ds := RTData new.
	ds samplingIfMoreThan: 2000.
	ds noDot; connectColor: Color red.
	ds points: (self precisions collectWithIndex: [ :y :i | i -> y ]).
	ds x: #key.
	ds y: #value.
	ds dotShape rectangle color: Color red.
	b addRight: ds.
	b axisX noDecimal; title: 'Epoch'.
	b axisY title: 'Error'.
	b axisYRight title: 'Precision'; color: Color red.
	b title: 'Learning rate ', self layers first neurons first learningRate asString.
	b open