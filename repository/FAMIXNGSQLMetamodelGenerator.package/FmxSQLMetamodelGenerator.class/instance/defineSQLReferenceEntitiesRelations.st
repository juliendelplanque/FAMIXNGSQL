definition
defineSQLReferenceEntitiesRelations
	"A type reference references a type."
	(typeReference property: #type)
		*- (type property: #references).

	"A table reference references a table."
	(tableReference property: #table)
		*- (table property: #references).

	"A view reference references a view."
	(viewReference property: #view)
		*- (view property: #references).

	"A derived table reference references a derived table."
	(derivedTableReference property: #derivedTable)
		*- (derivedTable property: #references).

	"A column reference references a column."
	(columnReference property: #column)
		*- (column property: #references).
		
	"A stored procedure call can contain other references (in its arguments)."
	((storedProcedureCall property: #arguments)
		<>-* (reference property: #storedProcedureContainer)) withoutPrimaryContainer.

	"A Local variable access must point a local variable."
	(localVariableAccess property: #localVariable)
		*- (localVariable property: #accesses).

	"A query contains multiple clauses"
	(crudQuery property: #clauses)
		<>-* (clause property: #query).

	"A QueryContainer contains multiple queries"
	(queryContainer property: #queries)
		<>-* (crudQuery property: #container).

	"An update query target a table"
	(table property: #updateQueries)
		-* (updateQuery property: #table).
		
	"A cursor reference references a cursor."
	(cursorReference property: #cursor)
		*- (cursor property: #references).