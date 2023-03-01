tests
testError

	self should: [ Normalization new normalizeData: #( #(10 5 1) ) ] raise: Error.