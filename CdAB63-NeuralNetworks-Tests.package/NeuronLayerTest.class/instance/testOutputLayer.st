tests
testOutputLayer 

	| nl1 nl2 result random |
	
	random := Random seed: 42.
	
	nl1 := NeuronLayer initializeNbOfNeurons: 3 nbOfWeights: 4 using: random.
	nl2 := NeuronLayer initializeNbOfNeurons: 4 nbOfWeights: 3 using: random.
	nl1 nextLayer: nl2.
	self deny: nl1 isOutputLayer.
	self assert: nl2 isOutputLayer.
	result := nl1 feed: #(1 2 3 4).
	self assert: result size equals: 4.
	result 
		with: #(0.03089402289518759 0.9220488835263312 0.5200462953493654 0.20276557516858304)
		do: [ :r :test |
			self assert: (r closeTo: test precision: 0.0000000001) ]