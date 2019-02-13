definition - structural
defineStructuralEntitiesRelations
	"A column references a type."
	(column property: #type) *- (type property: #columns).

	"A Constraint is contained in a Table."
	(table property: #constraints)
		<>-* (constraint property: #table).

	"A foreign key constraint references at least one column from another table."
	(foreignKeyConstraint property: #referencedColumns)
		*-* (column property: #foreignKeyConstraintsReferencing).

	"A table eventually has inheritance sub tables and zero or one inheritance super table."
	self flag: #TODO. "Reify inheritance relation."
	(table property: #superTable)
		*- (table property: #subTables)