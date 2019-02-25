*FamixNGSQL-Extensions
sourcedBelonger
	self container class = FmxSQLCursor
		ifTrue: [ ^ self container parentBehaviouralEntity ].
	^ self container ifNil: [ self derivedTableDefining sourcedBelonger ]