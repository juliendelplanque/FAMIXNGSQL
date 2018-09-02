visiting
visitPSQLASTPostfixOperator: aPSQLASTPostfixOperator
	(self childrenFor: aPSQLASTPostfixOperator) do: [:aChild | aChild acceptVisitor: self]