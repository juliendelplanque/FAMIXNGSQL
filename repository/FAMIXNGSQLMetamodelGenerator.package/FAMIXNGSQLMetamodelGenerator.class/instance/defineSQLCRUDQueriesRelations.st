definitions - SQL
defineSQLCRUDQueriesRelations
	"CRUDQuery relations."
	(crudQuery as: #TCRUDQuery property: #withClause)
		<>-*
	(crudQuery as: #TCRUDQuery property: #appearingInWithClauseOf).
	
	"SelectQuery relations."
	(selectQuery as: #TSelectQuery property: #selectClause)
		<>-*
	(reference as: #TReference property: #appearingInSelectClauseOf).
	
	(selectQuery as: #TSelectQuery property: #fromClause)
		<>-*
	(reference as: #TReference property: #appearingInFromClauseOfSelectQuery).
	
	(selectQuery as: #TSelectQuery property: #groupByClause)
		<>-*
	(reference as: #TReference property: #appearingInGroupByClauseOf).
	
	(selectQuery as: #TSelectQuery property: #havingClause)
		<>-*
	(reference as: #TReference property: #appearingInHavingClauseOf).
	
	(selectQuery as: #TSelectQuery property: #orderByClause)
		<>-*
	(reference as: #TReference property: #appearingInOrderByClauseOf).
	
	(selectQuery as: #TSelectQuery property: #whereClause)
		<>-*
	(reference as: #TReference property: #appearingInWhereClauseOfSelectQuery).
	
	(selectQuery as: #TSelectQuery property: #joinClause)
		<>-*
	(reference as: #TReference property: #appearingInJoinClauseOf).
	
	(selectQuery as: #TSelectQuery property: #unionClause)
		<>-
	(selectQuery as: #TSelectQuery property: #appearingInUnionClauseOf).
	
	(selectQuery as: #TSelectQuery property: #intersectClause)
		<>-
	(selectQuery as: #TSelectQuery property: #appearingInIntersectClauseOf).
	
	(selectQuery as: #TSelectQuery property: #exceptClause)
		<>-
	(selectQuery as: #TSelectQuery property: #appearingInExceptClauseOf).
	
	"InsertQuery relations."
	(insertQuery as: #TInsertQuery property: #onConflictClause)
		<>-*
	(reference as: #TReference property: #appearingInOnConflictClauseOf).
	
	(insertQuery as: #TInsertQuery property: #returningClause)
		<>-*
	(reference as: #TReference property: #appearingInReturningClauseOfInsertQuery).
	
	"UpdateQuery relations."
	(updateQuery as: #TUpdateQuery property: #setClause)
		<>-*
	(reference as: #TReference property: #appearingInSetClauseOf).
	
	(updateQuery as: #TUpdateQuery property: #fromClause)
		<>-*
	(reference as: #TReference property: #appearingInFromClauseOfUpdateQuery).
	
	(updateQuery as: #TUpdateQuery property: #whereClause)
		<>-*
	(reference as: #TReference property: #appearingInWhereClauseOfUpdateQuery).
	
	(updateQuery as: #TUpdateQuery property: #returningClause)
		<>-*
	(reference as: #TReference property: #appearingInReturningClauseOfUpdateQuery).
	
	"DeleteQuery relations."
	(deleteQuery as: #TDeleteQuery property: #whereClause)
		<>-*
	(reference as: #TReference property: #appearingInWhereClauseOfDeleteQuery).
	
	(deleteQuery as: #TDeleteQuery property: #returningClause)
		<>-*
	(reference as: #TReference property: #appearingInReturningClauseOfDeleteQuery).