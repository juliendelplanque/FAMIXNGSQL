*FamixNGSQL-Extensions
columnsToColumnReferences
	| mapping |
	mapping := Dictionary new.
	(self query selectClause outgoingColumnReferences groupedBy: [ :ref | ref belongsToGroup ifNil: [ ref ] ]) keys do: [ :outgoingRef |
		mapping
			at: (self query selectClause aliases
					detect: [ :alias | (outgoingRef class = FmxSQLColumnReference and: [ alias outgoingColumnReferences anySatisfy: [ :ref | (ref sourceAnchor interval includesAll: outgoingRef sourceAnchor interval) or: [ outgoingRef sourceAnchor interval includesAll: ref sourceAnchor interval ] ] ]) or: [ alias outgoingReferencesGroupReferences includes: outgoingRef ] ]
					ifFound: [ :alias | self columnNamed: alias name ]
					ifNone: [ 
						outgoingRef class = FmxSQLReferencesGroup
							ifTrue: [ self columnNamed: outgoingRef incomingReferencesGroupReference first source name ]
							ifFalse: [ self columnNamed: outgoingRef column name ] ])
			ifPresent: [ self halt ]
			ifAbsentPut: outgoingRef ].
	^ mapping