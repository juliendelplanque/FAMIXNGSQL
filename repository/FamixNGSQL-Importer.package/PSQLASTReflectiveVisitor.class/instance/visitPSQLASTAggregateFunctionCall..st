visiting
visitPSQLASTAggregateFunctionCall: aPSQLASTAggregateFunctionCall
	[ self createReferenceTo: (self findStoredProcedureNamed: (self visit: aPSQLASTAggregateFunctionCall functionIdentifier)) ]
		on: NotFound
		do: [ :error | self errorReport addError: error ].
	self visitAll: aPSQLASTAggregateFunctionCall expressions.
	self visit: aPSQLASTAggregateFunctionCall orderByClause