examples
parameterUpdateExampleMiniBatches

	| points a b f r nbOfPoints learningRate result deriMSEa deriMSEb mse g d ttr currentBatch miniBatches batchSize
		accumulatedMSE |
	
	ttr := [ r := Random seed: 42.
	nbOfPoints := 30000.
	points := (1 to: nbOfPoints) collect: [ :i | 
		(i / nbOfPoints) asFloat @((r next * 40 - 20 + i ) / nbOfPoints) asFloat ].
	
	currentBatch := OrderedCollection new.
	miniBatches := OrderedCollection new.
	batchSize := 5.
	
	1 to: points size do: [ :index |
		currentBatch add: (points at: index).
		index \\ batchSize = 0
			ifTrue: [ miniBatches add: currentBatch copy.
							currentBatch := OrderedCollection new ] ].
	a := 0.5.
	b := 3.
	f := [ :x | x * a + b ].
	
	learningRate := 0.01.
	result := OrderedCollection new.
	
	1000 timesRepeat: [ 
		accumulatedMSE := 0.
		miniBatches do: [ :pointsBatch |
			deriMSEa := (2 / pointsBatch size) * (pointsBatch collect: [ :aPoint |
									aPoint x * (aPoint y - (f value: aPoint x)) negated ]) sum.
			deriMSEb := (2 / pointsBatch size) * (pointsBatch collect: [ :aPoint |
								1 * (aPoint y - (f value: aPoint x)) negated ]) sum.
			a := a - (learningRate * deriMSEa).
			b := b - (learningRate * deriMSEb).
		
			mse := (pointsBatch collect: [ :aPoint |
				(aPoint y - (f value: aPoint x)) squared ]) sum / points size.
			accumulatedMSE := accumulatedMSE + mse ].
		result add: accumulatedMSE ] ] timeToRun.

	Transcript show: 'Time to run: '; show: ttr; cr.
	
	g := RTGrapher new.
	d := RTData new.
	d noDot; connectColor: Color blue.
	d points: result.
	d y: #yourself.
	g add: d.
	g open