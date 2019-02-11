visiting
visitPSQLASTSelectIntoQuery: aPSQLASTSelectIntoQuery
	|toReturn recordLocalVariable queryAliases otherColumns |
	toReturn := self visitPSQLASTSelectQuery: aPSQLASTSelectIntoQuery.
	recordLocalVariable := self visit: aPSQLASTSelectIntoQuery intoClause.
	recordLocalVariable class = FmxSQLRecordLocalVariable
		ifFalse: [ ^ toReturn ].
	queryAliases := toReturn entity aliases.
	otherColumns := toReturn entity columnsReferencedExceptNames: (queryAliases collect: #name).
	recordLocalVariable
		columns: queryAliases , otherColumns.
	^ toReturn