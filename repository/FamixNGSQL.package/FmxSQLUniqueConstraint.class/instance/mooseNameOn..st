printing
mooseNameOn: aStream
	aStream << $".
	super mooseNameOn: aStream.
	aStream << '" UNIQUE ('.
	(self outgoingColumnReferences collect: #column) do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') #';
		<< self mooseID.