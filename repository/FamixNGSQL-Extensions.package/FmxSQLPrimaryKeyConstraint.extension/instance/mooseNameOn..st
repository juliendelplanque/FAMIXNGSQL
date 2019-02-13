*FamixNGSQL-Extensions
mooseNameOn: aStream
	aStream << $".
	super mooseNameOn: aStream.
	aStream << '" PK ('.
	(self outgoingColumnReferences collect: #column) do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') #';
		<< self mooseID.