visiting
visitPSQLASTSelectQuery: aPSQLASTSelectQuery
	| selectQuery scopeManager selectClauseScope |
	scopeManager := self solver createScopeManager.
	selectQuery := self createQueryContainedByCurrentEntity: FmxSQLSelectQuery from: aPSQLASTSelectQuery.
	"first we look at the from clause to resolve references"
	self
		useCurrentEntity: selectQuery
		during: [ self
				visit: aPSQLASTSelectQuery fromClause
				thenDo: [ :fromScope | 
					"I have to precise that the from clause scope is not the current entity anymore"
					scopeManager pushScope: fromScope ].
			self visit: aPSQLASTSelectQuery withClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTSelectQuery allOrDistinctClause thenDo: [ :visitResult | self flag: #TODO ].
			self
				useCurrentEntity:
					((self createEntity: FmxSQLSelectClause)
						query: selectQuery;
						yourself)
				during: [ selectClauseScope := self solver topScope.
					self visitAll: aPSQLASTSelectQuery columnsAndAliasesSelected.
					scopeManager pushScope: selectClauseScope ].
			self visit: aPSQLASTSelectQuery whereClause.
			self visit: aPSQLASTSelectQuery groupByClause.
			self visit: aPSQLASTSelectQuery havingClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTSelectQuery windowClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTSelectQuery unionIntersectExceptClause.
			self visit: aPSQLASTSelectQuery orderByClause.
			self visit: aPSQLASTSelectQuery limitClause.
			self visit: aPSQLASTSelectQuery offsetClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTSelectQuery fetchClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTSelectQuery forClause thenDo: [ :visitResult | Halt now ].
			scopeManager clear ].
	"Here we return the select clause scope to be used if it is in a using clause"
	^ selectClauseScope