instance creation
fromContents: content

	self assert: [ content size = self size ] description: 'size mismatch'.
	
	content doWithIndex: [ :v :index |
		self array at: index put: v ]