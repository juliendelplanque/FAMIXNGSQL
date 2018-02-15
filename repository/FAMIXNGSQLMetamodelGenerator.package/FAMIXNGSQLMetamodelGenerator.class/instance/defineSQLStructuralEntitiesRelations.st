definitions - SQL
defineSQLStructuralEntitiesRelations
	"A columns container contains columns."
	(tColumnsContainer as: #TColumnsContainer property: #columns)
		<>-*
	(column as: #TColumn property: #columnsContainer).
	
	"A column references a type."
	(column as: #TColumn property: #type)
		*-
	(type as: #TType property: #columns).
	
	"A constraint references at least one column concerned by the constraint."
	(constraint as: #TConstraint property: #columns)
		*-*
	(column as: #TColumn property: #constraints).
	
	"A Constraint is contained in a Table."
	(table as: #TTable property: #constraints)
		<>-*
	(constraint as: #TConstraint property: #table).
	
	"A table eventually has inheritance sub tables and zero or one inheritance super table."
	(table as: #TTable property: #superTable)
		*-
	(table as: #TTable property: #subTables)