entity creation
createQueryContainedByCurrentEntity: aClass from: anASTNode
	| newQuery currentEntity |
	newQuery := self createEntity: aClass from: anASTNode.
	currentEntity := self currentEntity.
	currentEntity isQueryContainer
		ifTrue:
			[ "If current entity is a query container, we can directly set the entity as contained by it" newQuery container: currentEntity ]
		ifFalse: [ "Otherwise we need to create a reference to a DerivedTable"
			|derivedTable|
			derivedTable := (self createEntity: FmxSQLDerivedTable)
									query: newQuery;
									parentQuery: (self solver detect: [ :scope | scope entity isKindOf: FmxSQLCRUDQuery ]) entity;
									yourself.
			self createReferenceTo: derivedTable from: anASTNode
		 ].
	^ newQuery