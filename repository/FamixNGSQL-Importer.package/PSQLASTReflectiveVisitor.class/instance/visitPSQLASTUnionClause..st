visiting
visitPSQLASTUnionClause: aPSQLASTUnionClause
	self
		useCurrentEntity: (self createClause: FmxSQLUnionClause from: aPSQLASTUnionClause)
		during: [ self visit: aPSQLASTUnionClause selectQuery ]