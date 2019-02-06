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
	
	visitResult = self
		ifFalse: [
			^ PSQLEntityToBeAliased alias: alias entity: visitResult ].
	
	referencesDiff := ((model allWithSubTypesOf: FmxSQLReference) select: [ :r | r from = self currentEntity ]) \ references.
	referencesGroup := (self createEntity: FmxSQLReferencesGroup)
									references: referencesDiff;
									yourself.
	^ PSQLEntityToBeAliased alias: alias entity: referencesGroup