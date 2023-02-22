tests
testBasic 
	
	| n o |
	
	n := NNetwork new.
	n configure: 2 hidden: 2 nbOfOutputs: 1.
	o := n feed: #(1 3).
	self assert: o anyOne closeTo: 0.6745388083637035 precision: 0.0000000001.
	self assert: n numberOfOutputs equals: 1.