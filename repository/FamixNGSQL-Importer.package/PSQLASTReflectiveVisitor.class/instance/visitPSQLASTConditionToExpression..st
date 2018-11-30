visiting
visitPSQLASTConditionToExpression: aPSQLASTConditionToExpression
	aPSQLASTConditionToExpression childrenDo: [:aChild | aChild acceptVisitor: self]