examples
gradientDescentExample
	| points a b f learningRate deriMSEa deriMSEb g d |

	points :={(1 @ 3.0) . (3 @ 5.2) . (2 @ 4.1) . (4 @ 7.5)}.
	a := 0.5.
	b := 3.
	f := [ :x | x * a + b ].
	learningRate := 0.01.
	1000 timesRepeat: [
		deriMSEa := (2 / points size) * (points collect: [ :aPoint | 
				aPoint x * (aPoint y - (f value: aPoint x)) negated ]) sum.
		deriMSEb := (2 / points size) * (points collect: [ :aPoint | 
				1 * (aPoint y - (f value: aPoint x)) negated ]) sum.
		a := a - (learningRate * deriMSEa).
		b := b - (learningRate * deriMSEb).
	].

	g := RTGrapher new.
	d := RTData new.
	d dotShape color: Color red.
	d points: points.
	d x: #x; y: #y.
	g add: d.
	
	d := RTData new.
	d noDot; connectColor: Color blue.
	d dotShape color: Color blue.
	d points: (0 to: 5).
	d x: #yourself.
	d y: f.
	g add: d.
	
	g open