*FamixNGSQL-Extensions
columnsToColumnReferences
	| mapping |
	mapping := Dictionary new.
	self query selectClause outgoingColumnReferences reject: #isInReferencesGroup thenDo: [ :outgoingRef |
		mapping
			at: ((outgoingRef to references
				select: [ :incomingRef | self query selectClause aliases includes: incomingRef from ]
				thenCollect: [ :incomingRef | incomingRef from name ])
					ifNotEmpty: [ :anOrderedCollection | self columnNamed: anOrderedCollection first ]
					ifEmpty: [ self columnNamed: outgoingRef to name ])
			ifPresent: [ self halt ]
			ifAbsentPut: outgoingRef ].
	^ mapping