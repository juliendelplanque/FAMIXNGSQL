definitions - SQL
defineSQLMetaModelBehaviouralRelations
	"A Constraint is contained in a Table"
	(table as: #TTable property: #constraints)
		<>-*
	(constraint as: #TConstraint property: #table).
	
	"A Constraint can call StoredProcedures"
	(constraint as: #TConstraint property: #calls)
		-*
	(storedProcedureCall  as: #TStoredProcedureCall property: #callingConstraints).
	
	"A View is defined as a SelectQuery, thus, in the meta-model, a view contains
	 a SelectQuery."
	(view as: #TView property: #selectQuery)
		<>-
	(selectQuery as: #TSelectQuery property: #viewDefined).
	
	"A StoredProcedure can access columns in case it is used by a trigger."
	(storedProcedure as: #TStoredProcedure property: #columnAccesses)
		<>-*
	(columnAccess as: #TColumnAccess property: #accessingStoredProcedures).
	
	"A StoredProcedure can call other stored procedures in its source code."
	(storedProcedure as: #TStoredProcedure property: #calls)
		<>-*
	(storedProcedureCall as: #TStoredProcedureCall property: #callingStoredProcedure).
	
	"A StoredProcedure can contain CRUDQueries in its source code."
	(storedProcedure as: #TStoredProcedure property: #crudQueries)
		<>-*
	(crudQuery as: #TCRUDQuery property: #storedProcedure).
	
	"A SelectQuery can call StoredProcedure in its source code."
	(selectQuery as: #TSelectQuery property: #calls)
		<>-*
	(storedProcedureCall as: #TStoredProcedureCall property: #callingSelectQuery).
	
	"A CRUDQuery can access Columns in its source code."
	(crudQuery as: #TCRUDQuery property: #columnsAccessed)
		<>-*
	(columnAccess as: #TColumnAccess property: #accessingCRUDQuery).
	
	"A CRUDQuery can access Tables in its source code."
	(crudQuery as: #TCRUDQuery property: #columnsAccessed)
		<>-*
	(tableAccess as: #TTableAccess property: #accessingCRUDQuery)