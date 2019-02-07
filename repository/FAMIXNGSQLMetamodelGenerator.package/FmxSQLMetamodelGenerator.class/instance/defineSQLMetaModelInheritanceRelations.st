definition
defineSQLMetaModelInheritanceRelations
	"Abstract entities inheritance relations."
	structuralEntity --|> namedEntity.
	structuralEntity --|> #TNamespaceEntity.
	structuralEntity <|-- constraint.
	namedEntity <|-- behaviouralEntity. "Should be trait (not all behavioural entities have name)"
	behaviouralEntity --|> #TNamespaceEntity.
	"behaviouralEntity <|-- queryContainer."
	entity <|-- crudQuery.
	"Concrete structural entities inheritance relations."
	structuralEntity <|-- namespace.
	namespace --|> #TNamespace.
	table --|> structuralEntity.
	table --|> tColumnsContainer.
	table --|> tAbstractType.
	structuralEntity <|-- column.
	column --|> tColumn.
	structuralEntity <|-- type.
	tAbstractType <|-- type.
	tAbstractType <|-- view.
	constraint <|-- checkConstraint.
	checkConstraint --|> #TWithImmediateSource.
	constraint <|-- primaryKeyConstraint.
	constraint <|-- foreignKeyConstraint.
	constraint <|-- notNullConstraint.
	constraint <|-- uniqueConstraint.
	"Concrete behavioural entities inheritance relations."
	tColumnsContainer <|-- view.
	queryContainer <|-- view.
	view --|> #TNamespaceEntity.
	view --|> #TWithImmediateSource.
	namedEntity <|-- view.
	behaviouralEntity <|-- derivedTable.
	tColumnsContainer <|-- derivedTable.
	queryContainer <|-- derivedTable.
	queryContainer <|-- storedProcedure.
	
	storedProcedure --|> namedEntity.
	storedProcedure--|> #TNamespaceEntity.
	storedProcedure --|> #TWithReferences.
	storedProcedure --|> #TInvocable.
	storedProcedure --|> #TWithInvocations.
	storedProcedure --|> #TWithParameters.
	storedProcedure --|> #TWithLocalVariables.
	storedProcedure --|> #TWithAccesses.
	storedProcedure --|> tWithTableReference.
	storedProcedure --|> tWithAlias.
	storedProcedure --|> tWithCursor.
	storedProcedure --|> tWithCursorReference.
	storedProcedure --|> tWithColumnReference. "For COPY TYPE feature of Postgres."
	
	triggerStoredProcedure --|> storedProcedure.
	
	behaviouralEntity <|-- trigger.
	trigger --|> #TNamespaceEntity.
	"namedEntity <|-- trigger."
	crudQuery <|-- selectQuery.
	crudQuery <|-- insertQuery.
	crudQuery <|-- updateQuery.
	crudQuery <|-- deleteQuery.
	namedEntity <|-- parameter.
	parameter --|> #TParameter.
	parameter --|> #TAccessible.
	namedEntity <|-- localVariable.
	localVariable --|> #TLocalVariable.
	localVariable --|> #TAccessible.
	
	newLocalVariable --|> localVariable.
	newLocalVariable --|> tColumnsContainer.
	
	oldLocalVariable --|> localVariable.
	oldLocalVariable --|> tColumnsContainer.
	
	cursorParameter --|> namedEntity.
	cursorParameter --|> #TParameter.
	cursorParameter --|> #TAccessible.
	
	behaviouralEntity <|-- cursor.
	queryContainer <|-- cursor.
	cursor --|> #TWithParameters.
	
	alias --|> namedEntity.
	alias --|> tWithTableReference.
	alias --|> tWithColumnReference.
	alias --|> tWithDerivedTableReference.
	alias --|> tWithViewReference.
	alias --|> tWithReferencesGroupReference.
	alias --|> tColumn.
	alias --|> #TWithAccesses.
	alias --|> #TWithInvocations.
	alias --|> #TAccessible.
	
	referencesGroup --|> entity