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
	structuralEntity <|-- table.
	tColumnsContainer <|-- table.
	structuralEntity <|-- column.
	structuralEntity <|-- type.
	tAbstractType <|-- type.
	tAbstractType <|-- table.
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
	storedProcedure <|-- triggerStoredProcedure.
	
	behaviouralEntity <|-- trigger.
	trigger --|> #TNamespaceEntity.
	"namedEntity <|-- trigger."
	crudQuery <|-- selectQuery.
	crudQuery <|-- insertQuery.
	crudQuery <|-- updateQuery.
	crudQuery <|-- deleteQuery.
	namedEntity <|-- parameter.
	parameter --|> #TParameter.
	namedEntity <|-- localVariable.
	localVariable --|> #TLocalVariable.
	localVariable --|> #TAccessible.
	namedEntity <|-- cursorParameter.
	cursorParameter --|> #TParameter.
	behaviouralEntity <|-- cursor.
	queryContainer <|-- cursor.
	cursor --|> #TWithParameters.
	storedProcedure --|> #TWithParameters.
	storedProcedure --|> #TWithLocalVariables.
	
	alias --|> namedEntity.
	alias --|> tWithTableReference.
	alias --|> tWithColumnReference.
	alias --|> tWithDerivedTableReference.
	alias --|> tWithViewReference.
	alias --|> #TWithInvocations.