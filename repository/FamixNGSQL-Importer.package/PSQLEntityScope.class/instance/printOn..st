printing
printOn: aStream
	super printOn: aStream.
	aStream
		<< $(.
	aStream << $".
	self entity name printOn: aStream.
	aStream << '":'.
	self entity class printOn: aStream.
	aStream
		<< $)