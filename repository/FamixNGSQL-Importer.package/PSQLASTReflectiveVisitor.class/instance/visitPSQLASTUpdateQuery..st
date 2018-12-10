visiting
visitPSQLASTUpdateQuery: aPSQLASTUpdateQuery
	| scopeManager |
	scopeManager := self solver createScopeManager.
	self
		useCurrentEntity: (self createQueryContainedByCurrentEntity: FmxSQLUpdateQuery from: aPSQLASTUpdateQuery)
		during: [ self
				visit: aPSQLASTUpdateQuery fromClause
				thenDo: [ :fromScope | 
					"I have to precise that the from clause scope is not the current entity anymore"
					scopeManager pushScope: fromScope ].
			self
				visit: aPSQLASTUpdateQuery tableName
				thenDo: [ :tableName | self currentEntity table: (self findTableOrViewNamed: tableName) ].
			self flag: #TODO;
				useCurrentEntity:
					((self createEntity: FmxSQLSetClause)
						query: self currentEntity;
						yourself)
				during: [ self visit: aPSQLASTUpdateQuery setClause ].
			self visit: aPSQLASTUpdateQuery whereClause.
			self visit: aPSQLASTUpdateQuery returningClause.
			#(#alias #areDescendantTablesIncluded #hasOnly).
			self flag: #TODO.	"manage thing in this table"
			scopeManager clear ]