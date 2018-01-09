definitions - SQL
defineRelationsForTable 
	"A table contains [0-*] columns."
	(table as: #TTable property: #columns)
		<>-*
	(column as: #TColumn property: #table).

	"A table contains [0-*] constraints."
	(table as: #TTable property: #constraints)
		<>-*
	(constraint as: #TConstraint property: #table).

	"A table can inherits from another table."
	(table as: #TTable property: #childrenTables)
		-*
	(table as: #TTable property: #parentTable).

	"A table can have [0-*] triggers."
	(table as: #TTable property: #triggers)
		-*
	(trigger as: #TTrigger property: #table).

	
	"(table as: #TTable property: #queries)
		*-*
	(query as: #TQuery property: #fromTables)."

	"(table as: #TTable property: #queries)
		*-*
	(rewriteRule as: #TRewriteRule property: #fromTables)."
