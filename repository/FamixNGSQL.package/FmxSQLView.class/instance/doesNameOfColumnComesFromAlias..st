testing
doesNameOfColumnComesFromAlias: aFmxSQLColumn
	| referenceOrReferenceGroup |
	referenceOrReferenceGroup := (self columnsToColumnReferences at: aFmxSQLColumn).
	referenceOrReferenceGroup class = FmxSQLReferencesGroup
		ifTrue: [ ^ true ].
	
	^ referenceOrReferenceGroup column name ~= aFmxSQLColumn name