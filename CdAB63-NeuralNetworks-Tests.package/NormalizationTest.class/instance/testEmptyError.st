tests
testEmptyError

	self should: [ Normalization new normalizeData: #( ) ] raise: Error.