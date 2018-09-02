printing
printIdentifierPath: aStream
	aStream nextPutAll: self identifier.
	self isLast
		ifFalse: [ aStream nextPut: $..
			self next printIdentifierPath: aStream ]