examples
IrisDatasetExample

	| irisCSV lines tLines irisData n |

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
	n := NNetwork configure: 4 hidden: 6 nbOfOutputs: 3.
	n train: irisData nbEpochs: 1000.
	n viewLearningCurve.