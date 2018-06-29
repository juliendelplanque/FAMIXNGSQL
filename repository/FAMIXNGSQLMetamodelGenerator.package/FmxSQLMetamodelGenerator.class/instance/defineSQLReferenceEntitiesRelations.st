definitions - SQL
defineSQLReferenceEntitiesRelations
	"A stored procedure contains abstract references (regrouping variable accesses, references to views, tables...)"

	(storedProcedure as: #TStoredProcedure property: #references)
		<>-* (reference as: #TReference property: #storedProcedure).

	"A leaf access references a leaf entity."
	(parameterAccess as: #TParameterAccess property: #parameter)
		*- (parameter as: #TParameter property: #accesses).
		
	"A leaf access references a leaf entity."
	(cursorParameterAccess as: #TCursorParameterAccess property: #parameter)
		*- (cursorParameter as: #TCursorParameter property: #accesses).

	"A type reference references a type."
	(typeReference as: #TTypeReference property: #type)
		*- (type as: #TType property: #references).

	"A table reference references a table."
	(tableReference as: #TTableReference property: #table)
		*- (table as: #TTable property: #references).

	"A view reference references a view."
	(viewReference as: #TViewReference property: #view)
		*- (view as: #TView property: #references).

	"A derived table reference references a derived table."
	(derivedTableReference as: #TDerivedTableReference property: #derivedTable)
		*- (derivedTable as: #TDerivedTable property: #references).

	"A column reference references a column."
	(columnReference as: #TColumnReference property: #column)
		*- (column as: #TColumn property: #references).

	"A stored procedure call calls a stored procedure."
	(storedProcedureCall as: #TStoredProcedureCall property: #storedProcedure)
		*- (storedProcedure as: #TStoredProcedure property: #calls).

	"A stored procedure call can contain other references (in its arguments)."
	(storedProcedureCall as: #TStoredProcedureCall property: #arguments)
		<>-* (reference as: #TReference property: #storedProcedureContainer).

	"A Local variable access must point a local variable."
	(localVariableAccess as: #TLocalVariableAccess property: #localVariable)
		*- (localVariable as: #TLocalVariable property: #accesses).

	"A Clause can contain references."
	(clause as: #TClause property: #references)
		<>-* (reference as: #TReference property: #clause).

	"A query contains multiple clauses"
	(crudQuery as: #TCrudQuery property: #clauses)
		<>-* (clause as: #TClause property: #query).

	"A QueryContainer contains multiple queries"
	(queryContainer as: #TQueryContainer property: #queries)
		<>-* (crudQuery as: #TCrudQuery property: #container).

	"An update query target a table"
	(table as: #TTable property: #updateQueries)
		-* (updateQuery as: #TUpdateQuery property: #table).
		
	"A cursor reference references a cursor."
	(cursorReference as: #TCursorReference property: #cursor)
		*- (cursor as: #TCursor property: #references).