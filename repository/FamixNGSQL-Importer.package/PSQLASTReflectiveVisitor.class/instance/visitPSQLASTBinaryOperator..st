visiting
visitPSQLASTBinaryOperator: aPSQLASTBinaryOperator
	(self childrenFor: aPSQLASTBinaryOperator) do: [:aChild | aChild acceptVisitor: self]