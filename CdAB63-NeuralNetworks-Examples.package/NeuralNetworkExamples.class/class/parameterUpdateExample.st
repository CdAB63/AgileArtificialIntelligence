examples
parameterUpdateExample

	| points a b f r nbOfPoints learningRate result deriMSEa deriMSEb mse g d ttr |
	
	ttr := [ r := Random seed: 42.
	nbOfPoints := 30000.
	
	points := (1 to: nbOfPoints) collect: [ :i | 
		(i / nbOfPoints) asFloat @ ((r next * 40 - 20 + i) / nbOfPoints) asFloat ].
	
	a := 0.5.
	b := 3.
	f := [ :x | x * a + b ].
	learningRate := 0.01.
	result := OrderedCollection new.
	
	3000 timesRepeat: [ 
		deriMSEa := (2 / points size) * (points collect: [ :aPoint |
								aPoint x * (aPoint y - (f value: aPoint x)) negated ]) sum.
		deriMSEb := (2 / points size) * (points collect: [ :aPoint |
								1 * (aPoint y - (f value: aPoint x)) negated ]) sum.
		a := a - (learningRate * deriMSEa).
		b := b - (learningRate * deriMSEb).
		
		mse := (points collect: [ :aPoint |
			(aPoint y - (f value: aPoint x)) squared ]) sum / points size.
		result add: mse ] ] timeToRun.

	Transcript show: 'Time to run: '; show: ttr; cr.
	
	g := RTGrapher new.
	d := RTData new.
	d noDot; connectColor: Color blue.
	d points: result.
	d y: #yourself.
	g add: d.
	g open