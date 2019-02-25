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
									parentQuery: (self solver peekScopeAtIndex: 3) entity;
									yourself.
			^ PSQLDerivedTableToBeAliasedByColumn alias: alias entity: derivedTable astNode: aPSQLASTAliasDefinition definition ].
		
	visitResult = self
		ifFalse: [
			^ PSQLEntityToBeAliased alias: alias entity: visitResult astNode: aPSQLASTAliasDefinition definition ].
	
	referencesDiff := ((model allWithSubTypesOf: FmxSQLReference) select: [ :r | r from = self currentEntity ]) \ references.
	referencesGroup := (self createEntity: FmxSQLReferencesGroup)
									sourceAnchor: (self createSourceAnchorFrom: aPSQLASTAliasDefinition definition);
									references: referencesDiff;
									yourself.
	^ PSQLEntityToBeAliased alias: alias entity: referencesGroup astNode: aPSQLASTAliasDefinition definition