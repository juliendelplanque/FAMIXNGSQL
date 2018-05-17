definitions - SQL
defineSQLReferenceEntitiesRelations
	"A stored procedure contains abstract references (regrouping variable accesses, references to views, tables...)"
	(storedProcedure as: #TStoredProcedure property: #references)
		<>-*
	(reference as: #TReference property: #storedProcedure).

	"A leaf access references a leaf entity."
	(leafAccess as: #TLeafAccess property: #leafEntity)
		*-
	(leafEntity as: #TLeafEntity property: #accesses).
	
	"A type reference references a type."
	(typeReference as: #TTypeReference property: #type)
		*-
	(type as: #TType property: #references).
	
	"A table reference references a table."
	(tableReference as: #TTableReference property: #table)
		*-
	(table as: #TTable property: #references).
	
	"A view reference references a view."
	(viewReference as: #TViewReference property: #view)
		*-
	(view as: #TView property: #references).
	
	"A derived table reference references a derived table."
	(derivedTableReference as: #TDerivedTableReference property: #derivedTable)
		*-
	(derivedTable as: #TDerivedTable property: #references).
	
	"A column reference references a column."
	(columnReference as: #TColumnReference property: #column)
		*-
	(column as: #TColumn property: #references).
	
	"A stored procedure call calls a stored procedure."
	(storedProcedureCall as: #TStoredProcedureCall property: #storedProcedure)
		*-
	(storedProcedure as: #TStoredProcedure property: #calls).
	
	"A stored procedure call can contain other references (in its arguments)."
	(storedProcedureCall as: #TStoredProcedureCall property: #arguments)
		<>-*
	(reference as: #TReference property: #storedProcedureContainer).
		
	"A Local variable access must point a local variable."
	(localVariableAccess as: #TLocalVariableAccess property: #localVariable)
		*-
	(localVariable as: #TLocalVariable property: #accesses).
	
	"A CRUDQuery can contain references."
	(clause as: #TClause property: #references)
		<>-*
	(reference as: #TReference property: #clause).