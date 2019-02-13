*FamixNGSQL-Extensions
mooseNameOn: aStream
	aStream
		<< $".
	super mooseNameOn: aStream.
	aStream << '" FK ('.
	(self outgoingColumnReferences collect: #column) do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') REFERENCES ';
		<< self outgoingForeignKeyColumnReferences anyOne column columnsContainer name;
		<< $(.
	(self outgoingForeignKeyColumnReferences collect: #column) do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') #';
		<< self mooseID.