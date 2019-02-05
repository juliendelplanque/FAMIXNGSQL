visiting
visitPSQLASTAggregateFunctionCall: aPSQLASTAggregateFunctionCall
	self errorReport
		catch: NotFound
		during: [ self createReferenceTo: (self findStoredProcedureNamed: (self visit: aPSQLASTAggregateFunctionCall functionIdentifier)) ].
	self visitAll: aPSQLASTAggregateFunctionCall expressions.
	self visit: aPSQLASTAggregateFunctionCall orderByClause