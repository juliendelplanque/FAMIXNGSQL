definition
defineSQLStructuralEntitiesRelations
	"A columns container contains columns."

	(tColumnsContainer property: #columns)
		<>-* (column property: #columnsContainer).

	"A column references a type."
	(column property: #type) *- (type property: #columns).

	"A constraint references at least one column concerned by the constraint."
	(constraint property: #columns)
		*-* (column property: #constraints).

	"A Constraint is contained in a Table."
	(table property: #constraints)
		<>-* (constraint property: #table).

	"A table eventually has inheritance sub tables and zero or one inheritance super table."
	(table property: #superTable)
		*- (table property: #subTables)