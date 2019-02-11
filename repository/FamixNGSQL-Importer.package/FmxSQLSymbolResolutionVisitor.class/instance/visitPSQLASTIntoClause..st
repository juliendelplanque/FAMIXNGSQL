visiting
visitPSQLASTIntoClause: aPSQLASTIntoClause
	aPSQLASTIntoClause type ifNotNil: [ Halt now ].
	^ self visit: aPSQLASTIntoClause newTable