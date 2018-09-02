visiting
visitPSQLASTSelectIntoQuery: aPSQLASTSelectIntoQuery
	(self childrenFor: aPSQLASTSelectIntoQuery) do: [:aChild | aChild acceptVisitor: self]