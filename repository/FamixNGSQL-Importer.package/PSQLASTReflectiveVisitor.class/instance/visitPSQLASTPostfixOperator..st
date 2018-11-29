visiting
visitPSQLASTPostfixOperator: aPSQLASTPostfixOperator
	aPSQLASTPostfixOperator childrenDo: [:aChild | aChild acceptVisitor: self]