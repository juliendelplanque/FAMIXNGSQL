definition
defineSQLStructuralEntitiesRelations
	"A columns container contains columns."

	(tColumnsContainer property: #columns)
		<>-* (tColumn property: #columnsContainer).

	"A column references a type."
	(column property: #type) *- (type property: #columns).

	"A constraint references at least one column concerned by the constraint."
	(constraint property: #columns)
		*-* (column property: #constraints).

	"A Constraint is contained in a Table."
	(table property: #constraints)
		<>-* (constraint property: #table).

	"A foreign key constraint references at least one column from another table."
	(foreignKeyConstraint property: #referencedColumns)
		*-* (column property: #foreignKeyConstraintsReferencing).

	"A table eventually has inheritance sub tables and zero or one inheritance super table."
	(table property: #superTable)
		*- (table property: #subTables)