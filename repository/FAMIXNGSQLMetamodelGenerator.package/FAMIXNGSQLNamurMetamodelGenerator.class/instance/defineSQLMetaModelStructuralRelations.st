definitions - SQL
defineSQLMetaModelStructuralRelations
	"A table contains 0..* columns"
	(table as: #TTable property: #columns)
		<>-*
	(column as: #TColumn property: #table).
	
	"A table may have 0..* inheritance children"
	(table as: #TTable property: #children)
		-*
	(table as: #TTable property: #mother).
	