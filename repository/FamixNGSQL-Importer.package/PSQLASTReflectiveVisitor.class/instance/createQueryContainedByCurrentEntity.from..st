convenient
createQueryContainedByCurrentEntity: aClass from: anASTNode
	| newQuery currentEntity |
	newQuery := self createEntity: aClass from: anASTNode.
	currentEntity := self currentEntity.
	self flag: #TODO.	"change test to isQueryContainer"
	({ FmxSQLStoredProcedure. FmxSQLTriggerStoredProcedure. FmxSQLCursor. FmxSQLView } includes: currentEntity class)
		ifTrue:
			[ "If current entity is a storedProcedure we can directly set the entity as contained by it" newQuery container: currentEntity ]
		ifFalse: [ "Otherwise we need to create a reference to a DerivedTable"
			(self createEntity: FmxSQLDerivedTable)
				createReferenceEntityFrom: currentEntity;
				query: newQuery;
				columns: (newQuery clauses
								detect: [ :c | c class = FmxSQLSelectClause ]
								ifFound: [ :selectClause |
									selectClause aliases ]
								ifNone: [ #() ]);
				yourself ].
	^ newQuery