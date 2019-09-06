visiting
visitPSQLASTDistinctClause: aPSQLASTDistinctClause
	self flag: #TODO. "We do not have a distinct clause yet... Needs to be fixed in the MM."
	"aPSQLASTDistinctClause childrenDo: [:aChild | aChild acceptVisitor: self]"