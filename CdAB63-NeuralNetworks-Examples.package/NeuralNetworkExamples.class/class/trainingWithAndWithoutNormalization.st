as yet unclassified
trainingWithAndWithoutNormalization

	| n data |
	
	data := { #(0 0 0 0).
					 #(0 0 1 1).
					 #(0 1000 0 2).
					 #(0.1 0 0 4).
					 #(0.1 0 1 5).
					 #(0.1 1000 0 6).
					 #(0.1 1000 1 7) }.
	n := NNetwork configure: 3 hidden: 8 nbOfOutputs: 8.
	n trainWithoutNormalization: data nbEpochs: 10000.
	n viewLearningCurve.
	n := NNetwork configure: 3 hidden: 8 nbOfOutputs: 8.
	n train: data nbEpochs: 10000.
	n viewLearningCurve