definition - structural
defineStructuralReferenceEntities
	"A type reference references a type."
	(typeReference property: #type) target
		*- (type property: #references).

	"A table reference references a table."
	(tableReference property: #table) target
		*- (table property: #references).
		
	"A column reference references a column."
	(columnReference property: #column) target
		*- (column property: #references).