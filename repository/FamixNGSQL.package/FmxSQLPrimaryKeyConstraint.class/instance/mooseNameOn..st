printing
mooseNameOn: aStream
	aStream << $".
	super mooseNameOn: aStream.
	aStream << '" PK ('.
	self columns do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') #';
		<< self mooseID.