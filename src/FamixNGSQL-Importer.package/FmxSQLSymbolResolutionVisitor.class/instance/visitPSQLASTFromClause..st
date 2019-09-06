visiting
visitPSQLASTFromClause: aPSQLASTFromClause
	| fromScope |
	self
		useCurrentEntity: (self createClause: FmxSQLFromClause from: aPSQLASTFromClause)
		during: [ self visitAll: aPSQLASTFromClause items.
			fromScope := self solver topScope ].
	^ fromScope