printing
mooseNameOn: aStream
	aStream << $".
	super mooseNameOn: aStream.
	aStream << '" UNIQUE ('.
	self columns do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') #';
		<< self mooseID.