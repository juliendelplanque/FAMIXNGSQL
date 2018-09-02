visiting
visitPSQLASTPrefixOperator: aPSQLASTPrefixOperator
	(self childrenFor: aPSQLASTPrefixOperator) do: [:aChild | aChild acceptVisitor: self]