visiting
visitPSQLASTAliasDefinition: aPSQLASTAliasDefinition
	|references referencesDiff visitResult referencesGroup alias|
	references := OrderedCollection new.
	self currentEntity class = FmxSQLSelectClause
		ifTrue: [ references := (model allWithSubTypesOf: FmxSQLReference) select: [ :r | r from = self currentEntity ] ].
	visitResult := (self visit: aPSQLASTAliasDefinition definition).
	alias := self visit: aPSQLASTAliasDefinition alias.
	
	visitResult "The definition is just a constant..."
		ifNil: [ ^ PSQLConstantToBeAliased alias: alias ].
		
	visitResult class = SREntityScope "The definition is a derived table..."
		ifTrue: [ |query derivedTable|
			query := visitResult entity query.
			derivedTable := (self createEntity: FmxSQLDerivedTable)
									query: query;
									columns: (query clauses
									detect: [ :c | c class = FmxSQLSelectClause ]
									ifFound: [ :selectClause | selectClause aliases ]
									ifNone: [ #() ]);
									yourself.
			^ PSQLDerivedTableToBeAliasedByColumn alias: alias entity: derivedTable ].
		
	visitResult = self
		ifFalse: [
			^ PSQLEntityToBeAliased alias: alias entity: visitResult ].
	
	referencesDiff := ((model allWithSubTypesOf: FmxSQLReference) select: [ :r | r from = self currentEntity ]) \ references.
	referencesGroup := (self createEntity: FmxSQLReferencesGroup)
									references: referencesDiff;
									yourself.
	^ PSQLEntityToBeAliased alias: alias entity: referencesGroup