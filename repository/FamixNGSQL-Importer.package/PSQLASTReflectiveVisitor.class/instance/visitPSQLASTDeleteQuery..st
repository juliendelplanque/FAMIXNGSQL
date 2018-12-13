visiting
visitPSQLASTDeleteQuery: aPSQLASTDeleteQuery
	| scopeManager |
	scopeManager := self solver createScopeManager.
	self
		useCurrentEntity: (self createQueryContainedByCurrentEntity: FmxSQLDeleteQuery from: aPSQLASTDeleteQuery)
		during: [ "First we create the from clause of the query"
			self
				visit: aPSQLASTDeleteQuery tableName
				thenDo: [ :tableName | "Here we create manually the FROM clause because in the AST we do not model the FROM clause of a DELETE query with a node. We directly store the identifier of the table." 
					| fromClause fromClauseScope |
					fromClause := self createEntity: FmxSQLFromClause from: aPSQLASTDeleteQuery tableName.
					fromClause query: self currentEntity.
					fromClauseScope := SREntityScope currentEntity: fromClause.
					scopeManager pushScope: fromClauseScope andDoAsCurrentEntity: [ self createReferenceTo: (self findTableOrViewNamed: tableName) ].
					 ].
			self visit: aPSQLASTDeleteQuery withClause thenDo: [ :withClause | scopeManager pushScope: withClause ].
			self visit: aPSQLASTDeleteQuery usingList thenDo: [ :usingScope | scopeManager pushScope: usingScope ].
			self visit: aPSQLASTDeleteQuery whereClause.
			self visit: aPSQLASTDeleteQuery returningClause.
			scopeManager clear ]