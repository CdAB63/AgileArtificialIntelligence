as yet unclassified
normalizeData: aCollectionOfTrainingDataWithExpectedOutput min: minimumValues max: maximumValues

	| nbOfColumns result min max |
	
	nbOfColumns := aCollectionOfTrainingDataWithExpectedOutput first size - 1.
	result := OrderedCollection new.
	aCollectionOfTrainingDataWithExpectedOutput do: [ :row |
		| t v |
		t := OrderedCollection new.
		1 to: nbOfColumns do: [ :index |
			v := row at: index.
			min := minimumValues at: index.
			max := maximumValues at: index.
			t add: ((v - min) / (max - min)) asFloat ].
		t add: row last.
		result add: t asArray ].
	^ result asArray