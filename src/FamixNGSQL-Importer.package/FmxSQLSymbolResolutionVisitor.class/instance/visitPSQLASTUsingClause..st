visiting
visitPSQLASTUsingClause: aPSQLASTUsingClause
	| usingScope |
	self
		useCurrentEntity: (self createClause: FmxSQLUsingClause from: aPSQLASTUsingClause)
		during: [ usingScope := self solver topScope.
			self visitAll: aPSQLASTUsingClause list ].
	^ usingScope