visiting
visitPSQLASTArrayConstructor: aPSQLASTArrayConstructor
	(self childrenFor: aPSQLASTArrayConstructor) do: [:aChild | aChild acceptVisitor: self]