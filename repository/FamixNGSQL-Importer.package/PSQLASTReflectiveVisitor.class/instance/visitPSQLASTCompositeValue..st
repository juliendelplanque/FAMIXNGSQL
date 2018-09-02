visiting
visitPSQLASTCompositeValue: aPSQLASTCompositeValue
	(self childrenFor: aPSQLASTCompositeValue) do: [:aChild | aChild acceptVisitor: self]