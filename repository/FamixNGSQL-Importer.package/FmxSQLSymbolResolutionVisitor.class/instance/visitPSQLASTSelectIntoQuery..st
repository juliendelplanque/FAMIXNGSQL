visiting
visitPSQLASTSelectIntoQuery: aPSQLASTSelectIntoQuery
	|toReturn recordLocalVariable |
	toReturn := self visitPSQLASTSelectQuery: aPSQLASTSelectIntoQuery.
	recordLocalVariable := self visit: aPSQLASTSelectIntoQuery intoClause.
	recordLocalVariable class = FmxSQLRecordLocalVariable
		ifFalse: [ ^ toReturn ].
	recordLocalVariable
		queryBoundTo: toReturn entity query.
	^ toReturn