initialization
defineRelationsForColumn

"	(column as: #TColumn property: #fkColumn)
		*-*
	(column as: #TColumn property: #table)."

	(column as: #TColumn property: #referencingExpressions)
		*-*
	(expression as: #TExpression property: #referencedColumns).

	(column as: #TColumn property: #referencingInsertQueries)
		*-*
	(insertQuery as: #TInsertQuery property: #referencedColumns).

	(column as: #TColumn property: #referencingUpdateQueries)
		*-*
	(updateQuery as: #TUpdateQuery property: #referencedColumns).

