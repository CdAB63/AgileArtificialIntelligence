instance creation
rateNegativeX: raten ratePositiveX: ratep

	| af |
	
	af := self new.
	af rateNeg: raten.
	af ratePos: ratep.
	^ af