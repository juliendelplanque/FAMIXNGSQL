printing
mooseNameOn: aStream
	aStream
		<< $".
	super mooseNameOn: aStream.
	aStream << '" FK ('.
	self columns do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') REFERENCES ';
		<< self referencedColumns anyOne columnsContainer name;
		<< $(.
	self referencedColumns do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') #';
		<< self mooseID.