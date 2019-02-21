*FamixNGSQL-Extensions
columnsToColumnReferences
	^ (self query selectClause outgoingColumnReferences collect: [ :outgoingRef |
		((outgoingRef to references
			select: [ :incomingRef | self query selectClause aliases includes: incomingRef from ]
			thenCollect: [ :incomingRef | incomingRef from name ])
				ifNotEmpty: [ :anOrderedCollection | self columnNamed: anOrderedCollection first ]
				ifEmpty: [ self columnNamed: outgoingRef to name ]) -> outgoingRef ]) asDictionary