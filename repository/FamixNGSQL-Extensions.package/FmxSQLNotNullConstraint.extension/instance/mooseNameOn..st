*FamixNGSQL-Extensions
mooseNameOn: aStream
	aStream << 'NOT NULL ('.
	self columns do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') #';
		<< self mooseID.