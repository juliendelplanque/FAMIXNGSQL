entity creation
createQueryContainedByCurrentEntity: aClass from: anASTNode
	| newQuery currentEntity |
	newQuery := self createEntity: aClass from: anASTNode.
	currentEntity := self currentEntity.
	currentEntity isQueryContainer
		ifTrue:
			[ "If current entity is a storedProcedure we can directly set the entity as contained by it" newQuery container: currentEntity ]
		ifFalse: [ "Otherwise we need to create a reference to a DerivedTable"
			|derivedTable|
			derivedTable := (self createEntity: FmxSQLDerivedTable)
									query: newQuery;
									yourself.
			self createReferenceTo: derivedTable from: anASTNode
		 ].
	^ newQuery