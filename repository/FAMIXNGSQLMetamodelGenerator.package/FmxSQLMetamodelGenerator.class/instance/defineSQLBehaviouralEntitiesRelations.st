definition
defineSQLBehaviouralEntitiesRelations
	"A stored procedure contains abstract references (regrouping variable accesses, references to views, tables...)"
	((referenceContainer property: #references)
		<>-* (reference property: #container)) withoutPrimaryContainer.
		
	"A CheckConstraint can call StoredProcedures"
	(checkConstraint property: #storedProceduresCalled)
		*-*
	(storedProcedure property: #checkConstraintsCalling).
	
	"A View is defined as a SelectQuery, thus, in the meta-model, a view contains a SelectQuery."
	((view property: #query)
		<>-
	(selectQuery property: #viewDefining)) withoutPrimaryContainer.
	
	"A DerivedTable is defined as a SelectQuery, thus, in the meta-model, a view contains a SelectQuery."
	((derivedTable property: #query)
		<>-
	(selectQuery property: #derivedTableDefining)) withoutPrimaryContainer.
	
	"A SelectQuery can define multiple derived tables."
	(selectQuery property: #derivedTablesDefined)
		<>-*
	(derivedTable property: #parentQuery).
	
	"A StoredProcedure has a return AbstractType."
	(storedProcedure property: #returnType)
		*-
	(tAbstractType property: #storedProceduresReturning).
	
	"A LocalVariable has an AbstractType."
	(localVariable property: #type)
		*-
	(tAbstractType property: #localVariables).
	
	"A Parameter has an AbstractType."
	(parameter property: #type)
		*-
	(tAbstractType property: #parameters).
	
	"A Cursor Parameter has an AbstractType."
	(cursorParameter property: #type)
		*-
	(tAbstractType property: #cursorParameters).
	
	"A stored procedure used by a trigger can reference Columns."
	(triggerStoredProcedure property: #columnsReferenced)
		<>-*
	(columnReference property: #triggerStoredProceduresReferencing).
	
	"The generalized trigger is now defined as always referencing a TriggerStoredProcedure.
	For DBMS where the trigger code is directly defined in the trigger, a virtual TriggerStoredProcedure
	is created to hold its source code."
	(trigger property: #storedProcedure)
		*-
	(triggerStoredProcedure property: #triggers).
	
	"A Trigger is contained in a Table. This is composition because, if the Table is removed,
	 the Trigger should be as well because it makes no sense to have a a trigger reacting to
	events of a non-existing table."
	(table property: #triggers)
		<>-*
	(trigger property: #table).
	
	"A clause may define aliases"
	(clause property: #aliases)
		<>-*
	(alias property: #clause).
	
	"A cursor is held in a stored procedure."
	(storedProcedure property: #cursors)
		<>-*
	(cursor property: #storedProcedure)