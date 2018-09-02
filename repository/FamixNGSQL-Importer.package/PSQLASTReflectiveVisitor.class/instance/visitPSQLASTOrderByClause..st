visiting
visitPSQLASTOrderByClause: aPSQLASTOrderByClause
	self
		useCurrentEntity: (self createClause: FmxSQLOrderByClause from: aPSQLASTOrderByClause)
		during: [ self visitAll: aPSQLASTOrderByClause items ]