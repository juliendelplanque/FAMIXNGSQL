definitions - SQL
defineSQLStructuralEntitiesRelations
	"A columns container contains columns."

	(tColumnsContainer property: #columns)
		<>-* (column as: #TColumn property: #columnsContainer).

	"A column references a type."
	(column as: #TColumn property: #type) *- (type as: #TType property: #columns).

	"A constraint references at least one column concerned by the constraint."
	(constraint as: #TConstraint property: #columns)
		*-* (column as: #TColumn property: #constraints).

	"A Constraint is contained in a Table."
	(table as: #TTable property: #constraints)
		<>-* (constraint as: #TConstraint property: #table).

	"A foreign key constraint references at least one column from another table."
	(foreignKeyConstraint as: #TForeignKeyConstraint property: #referencedColumns)
		*-* (column as: #TColumn property: #foreignKeyConstraintsReferencing).

	"A table eventually has inheritance sub tables and zero or one inheritance super table."
	(table as: #TTable property: #superTable)
		*- (table as: #TTable property: #subTables).

	"Any entityInNamespace can be part of a namespace"
	(tEntityInNamespace property: #namespace)
		*-<> (namespace as: #TNamespace property: #entities)