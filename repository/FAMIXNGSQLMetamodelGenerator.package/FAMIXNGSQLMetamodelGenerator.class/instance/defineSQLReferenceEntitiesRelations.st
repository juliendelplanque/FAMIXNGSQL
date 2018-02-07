definitions - SQL
defineSQLReferenceEntitiesRelations
	"A reference contains a source anchor"
	(reference as: #TReference property: #sourceAnchor)
		<>-
	(sourceAnchor as: #TSourceAnchor property: #reference).
	
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
	
	"A CRUDQuery can contain references."
	(crudQuery as: #TCRUDQuery property: #references)
		<>-*
	(reference as: #TReference property: #crudQueryContainer)