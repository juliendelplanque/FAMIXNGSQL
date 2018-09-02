visiting
visitPSQLASTDefaultValue: aPSQLASTDefaultValue
	(self childrenFor: aPSQLASTDefaultValue) do: [:aChild | aChild acceptVisitor: self]