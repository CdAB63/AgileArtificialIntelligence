instance creation
newArrayFromHandle: aHandle

	^ FFIExternalArray 
		fromHandle: aHandle 
		type: 'double'
		size: self nbRows * self nbColumns