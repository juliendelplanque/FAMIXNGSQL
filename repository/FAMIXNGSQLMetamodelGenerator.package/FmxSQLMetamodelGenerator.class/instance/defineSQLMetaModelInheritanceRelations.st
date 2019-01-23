definition
defineSQLMetaModelInheritanceRelations
	"Abstract entities inheritance relations."
	structuralEntity --|> namedEntity.
	structuralEntity --|> #TNamespaceEntity.
	structuralEntity <|-- constraint.
	namedEntity <|-- behaviouralEntity. "Should be trait (not all behavioural entities have name)"
	behaviouralEntity --|> #TNamespaceEntity.
	"behaviouralEntity <|-- queryContainer."
	association <|-- reference.
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
	constraint <|-- primaryKeyConstraint.
	constraint <|-- foreignKeyConstraint.
	foreignKeyConstraint --|> tColumnsReferencer.
	constraint <|-- notNullConstraint.
	constraint <|-- uniqueConstraint.
	"Concrete behavioural entities inheritance relations."
	tColumnsContainer <|-- view.
	queryContainer <|-- view.
	view --|> #TNamespaceEntity.
	namedEntity <|-- view.
	behaviouralEntity <|-- derivedTable.
	tColumnsContainer <|-- derivedTable.
	queryContainer <|-- derivedTable.
	queryContainer <|-- storedProcedure.
	storedProcedure--|> #TNamespaceEntity.
	storedProcedure --|> #TWithReferences.
	namedEntity <|-- referenceContainer.
	referenceContainer <|-- storedProcedure.
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
	namedEntity <|-- cursorParameter.
	cursorParameter --|> #TParameter.
	behaviouralEntity <|-- cursor.
	queryContainer <|-- cursor.
	cursor --|> #TWithParameters.
	referenceContainer <|-- alias.
	storedProcedure --|> #TWithParameters.
	storedProcedure --|> #TWithLocalVariables.
	"Concrete reference entities inheritance relations."
	reference <|-- tableReference.
	reference <|-- derivedTableReference.
	reference <|-- viewReference.
	reference <|-- parameterAccess.
	reference <|-- cursorParameterAccess.
	reference <|-- columnReference.
	reference <|-- typeReference.
	reference <|-- storedProcedureCall.
	reference --|> #TArgument.
	reference <|-- localVariableAccess.
	reference <|-- cursorReference.
	reference <|-- aliasAccess.