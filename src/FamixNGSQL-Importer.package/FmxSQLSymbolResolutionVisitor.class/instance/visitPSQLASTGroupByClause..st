visiting
visitPSQLASTGroupByClause: aPSQLASTGroupByClause
	self
		useCurrentEntity: (self createClause: FmxSQLGroupByClause from: aPSQLASTGroupByClause)
		during: [ self visitAll: aPSQLASTGroupByClause expressions ]