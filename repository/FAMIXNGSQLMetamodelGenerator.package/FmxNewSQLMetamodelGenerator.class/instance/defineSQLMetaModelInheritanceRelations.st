definition
defineSQLMetaModelInheritanceRelations
	"Abstract entities inheritance relations."
	structuralEntity --|> namedEntity.
	structuralEntity <|-- constraint.
	sourcedEntity <|-- behaviouralEntity.
	behaviouralEntity <|-- queryContainer.
	behaviouralEntity --|> sourcedEntity.
	sourcedEntity <|-- reference.
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
	"behaviouralEntity <|-- checkConstraint."
	sourcedEntity <|-- checkConstraint.
	self flag: 'Should inherit this from Behavioural entity but apparently it s not.'.
	constraint <|-- primaryKeyConstraint.
	constraint <|-- foreignKeyConstraint.
	constraint <|-- notNullConstraint.
	constraint <|-- uniqueConstraint.
	"Concrete behavioural entities inheritance relations."
	tColumnsContainer <|-- view.
	queryContainer <|-- view.
	view --|> #TNamespaceEntity.
	namedEntity <|-- view.
	tColumnsContainer <|-- derivedTable.
	queryContainer <|-- derivedTable.
	queryContainer <|-- storedProcedure.
	storedProcedure--|> #TNamespaceEntity.
	namedEntity <|-- referenceContainer.
	referenceContainer --|> #TWithReferences.
	referenceContainer <|-- storedProcedure.
	storedProcedure <|-- triggerStoredProcedure.
	behaviouralEntity <|-- trigger.
	trigger --|> #TNamespaceEntity.
	namedEntity <|-- trigger.
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
	queryContainer <|-- cursor.
	cursor --|> #TWithParameters.
	referenceContainer <|-- alias.
	referenceContainer <|-- storedProcedure.
	storedProcedure --|> #TWithParameters.
	storedProcedure --|> #TWithLocalVariables.
	referenceContainer <|-- clause.
	"Concrete reference entities inheritance relations."
	reference <|-- tableReference.
	reference --|> #TReference.
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