as yet unclassified
normalizeData: aCollectionOfTrainingDataWithExpectedOutput

	| nbOfColumns min max |
	
	nbOfColumns := aCollectionOfTrainingDataWithExpectedOutput first size - 1.
	min := OrderedCollection new.
	max := OrderedCollection new.
	1 to: nbOfColumns do: [ :index |
		| column |
		column := aCollectionOfTrainingDataWithExpectedOutput collect: [ :row |
			row at: index ].
		min add: column min.
		max add: column max ].
	^ self normalizeData: aCollectionOfTrainingDataWithExpectedOutput min: min max: max