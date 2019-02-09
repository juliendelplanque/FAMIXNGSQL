visiting
visitPSQLASTValuesClause: aPSQLASTValuesClause
	self
		useCurrentEntity: (self createClause: FmxSQLValuesClause from: aPSQLASTValuesClause)
		during: [ self visit: aPSQLASTValuesClause values ]