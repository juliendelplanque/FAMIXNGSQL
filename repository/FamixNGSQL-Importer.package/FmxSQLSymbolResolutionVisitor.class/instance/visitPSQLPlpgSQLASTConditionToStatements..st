visiting
visitPSQLPlpgSQLASTConditionToStatements: aPSQLPlpgSQLASTConditionToStatements
	aPSQLPlpgSQLASTConditionToStatements childrenDo: [:aChild | aChild acceptVisitor: self]