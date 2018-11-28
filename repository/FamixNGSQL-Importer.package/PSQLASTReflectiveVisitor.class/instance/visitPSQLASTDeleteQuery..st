visiting
visitPSQLASTDeleteQuery: aPSQLASTDeleteQuery
	| scopeManager |
	scopeManager := self solver createScopeManager.
	self
		useCurrentEntity: (self createQueryContainedByCurrentEntity: FmxSQLDeleteQuery from: aPSQLASTDeleteQuery)
		during: [ "First we create the from clause of the query"
			self
				visit: aPSQLASTDeleteQuery tableName
				thenDo: [ :tableName | 
					|fromClause|
					fromClause := self createEntity: FmxSQLFromClause from: aPSQLASTDeleteQuery tableName.
					fromClause query: self currentEntity.
					self
						useCurrentEntity: fromClause
						during: [ self createReferenceTo: (self findTableOrViewNamed: tableName) ] ].
			self visit: aPSQLASTDeleteQuery withClause.
			self
				visit: aPSQLASTDeleteQuery usingList
				thenDo: [ :usingScope | 
					usingScope isCurrentEntity: false.
					scopeManager pushScope: usingScope ].
			self visit: aPSQLASTDeleteQuery whereClause.
			self visit: aPSQLASTDeleteQuery returningClause.
			scopeManager clear ]