visiting
visitPSQLASTLimitClause: aPSQLASTLimitClause
	self
		useCurrentEntity: (self createClause: FmxSQLLimitClause from: aPSQLASTLimitClause)
		during: [ self visit: aPSQLASTLimitClause limit ]