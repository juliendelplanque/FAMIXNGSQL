definitions - SQL
defineSQLCodeFragmentRelations
	"An access to a Column references a Column"
	(columnAccess as: #TColumnAccess property: #column)
		*-
	(column as: #TColumn property: #accesses).
	
	"An access to a Table references a Table"
	(tableAccess as: #TTableAccess property: #table)
		*-
	(table as: #TTable property: #accesses).
	
	"A call to a StoredProcedure references a StoredProcedure"
	(storedProcedureCall as: #TStoredProcedureCall property: #storedProcedure)
		*-
	(storedProcedure as: #TStoredProcedure property: #calls).