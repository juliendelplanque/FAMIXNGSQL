definition - structural
defineStructuralReferenceEntities
	"A type reference references a type."
	(typeReference property: #type)
		*- (type property: #references).

	"A table reference references a table."
	(tableReference property: #table)
		*- (table property: #references).
		
	"A column reference references a column."
	(columnReference property: #column)
		*- (column property: #references).