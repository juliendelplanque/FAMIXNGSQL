visiting
visitPSQLASTDefaultValues: aPSQLASTDefaultValues
	(self childrenFor: aPSQLASTDefaultValues) do: [:aChild | aChild acceptVisitor: self]