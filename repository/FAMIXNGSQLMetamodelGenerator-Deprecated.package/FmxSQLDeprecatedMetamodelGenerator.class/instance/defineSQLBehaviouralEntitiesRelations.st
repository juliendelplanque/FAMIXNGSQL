definitions - SQL
defineSQLBehaviouralEntitiesRelations
	"A sourced entity contains a source anchor"
	(tSourcedEntity as: #TSourcedEntity property: #sourceAnchor)
		<>-
	(sourceAnchor as: #TSourceAnchor property: #behaviouralEntity).
	
	"A CheckConstraint can call StoredProcedures"
	(checkConstraint as: #TCheckConstraint property: #storedProceduresCalled)
		*-*
	(storedProcedure as: #TStoredProcedure property: #checkConstraintsCalling).
	
	"A View is defined as a SelectQuery, thus, in the meta-model, a view contains a SelectQuery."
	(view as: #TView property: #query)
		<>-
	(selectQuery as: #TSelectQuery property: #viewDefining).
	
	"A DerivedTable is defined as a SelectQuery, thus, in the meta-model, a view contains a SelectQuery."
	(derivedTable as: #TDerivedTable property: #query)
		<>-
	(selectQuery as: #TSelectQuery property: #derivedTableDefining).
	
	"A SelectQuery can define multiple derived tables."
	(selectQuery as: #TSelectQuery property: #derivedTablesDefined)
		<>-*
	(derivedTable as: #TDerivedTable property: #parentQuery).
	
	"A StoredProcedure has a return AbstractType."
	(storedProcedure as: #TStoredProcedure property: #returnType)
		*-
	(tAbstractType property: #storedProceduresReturning).
	
	"A StoredProcedure may have parameters."
	(storedProcedure as: #TStoredProcedure property: #parameters)
		<>-*
	(parameter as: #TParameter property: #storedProcedure).
	
	"A StoredProcedure may have local variables."
	(storedProcedure as: #TStoredProcedure property: #localVariables)
		<>-*
	(localVariable as: #TLocalVariable property: #storedProcedure).
	
	"A Cursor may have cursor parameters."
	(cursor as: #TCursor property: #parameters)
		<>-*
	(cursorParameter as: #TCursorParameter property: #cursor).
	
	"A LocalVariable has an AbstractType."
	(localVariable as: #TLocalVariable property: #type)
		*-
	(tAbstractType property: #localVariables).
	
	"A Parameter has an AbstractType."
	(parameter as: #TParameter property: #type)
		*-
	(tAbstractType property: #parameters).
	
	"A Cursor Parameter has an AbstractType."
	(cursorParameter as: #TCursorParameter property: #type)
		*-
	(tAbstractType property: #cursorParameters).
	
	"A stored procedure used by a trigger can reference Columns."
	(triggerStoredProcedure as: #TTriggerStoredProcedure property: #columnsReferenced)
		<>-*
	(columnReference as: #TColumnReference property: #triggerStoredProceduresReferencing).
	
	"The generalized trigger is now defined as always referencing a TriggerStoredProcedure.
	For DBMS where the trigger code is directly defined in the trigger, a virtual TriggerStoredProcedure
	is created to hold its source code."
	(trigger as: #TTrigger property: #storedProcedure)
		*-
	(triggerStoredProcedure as: #TTriggerStoredProcedure property: #triggers).
	
	"A Trigger is contained in a Table. This is composition because, if the Table is removed,
	 the Trigger should be as well because it makes no sense to have a a trigger reacting to
	events of a non-existing table."
	(table as: #TTable property: #triggers)
		<>-*
	(trigger as: #TTrigger property: #table).
	
	"A clause may define aliases"
	(clause as: #TClause property: #aliases)
		<>-*
	(alias as: #TAlias property: #clause).