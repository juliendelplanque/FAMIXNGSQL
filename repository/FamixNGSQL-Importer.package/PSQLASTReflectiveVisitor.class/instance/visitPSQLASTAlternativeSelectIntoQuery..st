visiting
visitPSQLASTAlternativeSelectIntoQuery: aPSQLASTAlternativeSelectIntoQuery
	(self childrenFor: aPSQLASTAlternativeSelectIntoQuery) do: [:aChild | aChild acceptVisitor: self]