initialization
defineRelationsForTable 

	(table as: #TTable property: #columns)
		<>-*
	(column as: #TColumn property: #table).

	(table as: #TTable property: #constraints)
		<>-*
	(constraint as: #TConstraint property: #table).

	(table as: #TTable property: #childrenTables)
		-*
	(table as: #TTable property: #parentTable).

	(table as: #TTable property: #triggers)
		-*
	(trigger as: #TTrigger property: #table).

	(table as: #TTable property: #queries)
		*-*
	(query as: #TQuery property: #fromTables).

	"(table as: #TTable property: #queries)
		*-*
	(rewriteRule as: #TRewriteRule property: #fromTables)."
