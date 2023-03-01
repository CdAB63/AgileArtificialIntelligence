examples
IrisDatasetExampleTestingAndValidation

	| irisCSV lines tLines irisData shuffledIrisData
	  n cut cutTraining cutTest trainingData testData
	  precision |

	irisCSV := (ZnEasy get: 'https://agileartificialintelligence.github.io/Datasets/iris.csv') contents.
	lines := irisCSV lines.
	lines := lines allButFirst.
	tLines := lines collect: [ :l |
		| ss |
		ss := l substrings: ','.
		(ss allButLast collect: [ :w | w asNumber ]), (Array with: ss last) ].
	irisData := tLines collect: [ :row |
		| l |
		row last = 'setosa' ifTrue: [ l := #( 0 ) ].
		row last = 'versicolor' ifTrue: [ l := #( 1 ) ].
		row last = 'virginica' ifTrue: [ l := #( 2 ) ].
		row allButLast, l ].
	shuffledIrisData := irisData shuffleBy: (Random seed: 42).
	cut := 0.8.
	cutTraining := (shuffledIrisData  size * cut) rounded.
	cutTest := (shuffledIrisData  size * (1 - cut)) rounded.
	trainingData := shuffledIrisData  first: cutTraining.
	testData := shuffledIrisData  last: cutTest.
	n := NNetwork configure: 4 hidden: 6 nbOfOutputs: 3.
	n train: trainingData nbEpochs: 1000.
	precision := (((testData collect: [ :d |
		(n predict: d allButLast) = d last ]) select: [ :d | d = true ]) size / testData size)
			asFloat round: 4.
	Transcript show: 'Precision: '; show: precision; cr.
	n viewLearningCurve.