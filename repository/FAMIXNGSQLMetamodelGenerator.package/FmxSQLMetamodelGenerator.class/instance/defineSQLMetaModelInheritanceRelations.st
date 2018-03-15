definitions - SQL
defineSQLMetaModelInheritanceRelations
	"Abstract entities inheritance relations."
	tNamedEntity <|-- structuralEntity.
	structuralEntity <|-- constraint.
	tSourcedEntity <|-- behaviouralEntity.
	behaviouralEntity <|-- queryContainer.
	queryContainer <|-- crudQuery.
	tSourcedEntity <|-- reference.
	"Concrete structural entities inheritance relations."
	structuralEntity <|-- table.
	tColumnsContainer <|-- table.
	structuralEntity <|-- column.
	structuralEntity <|-- type.
	constraint <|-- checkConstraint.
	"behaviouralEntity <|-- checkConstraint."
	tSourcedEntity <|-- checkConstraint. self flag: 'Should inherit this from Behavioural entity but apparently it s not.'.
	constraint <|-- primaryKeyConstraint.
	constraint <|-- foreignKeyConstraint.
	constraint <|-- notNullConstraint.
	constraint <|-- uniqueConstraint.
	"Concrete behavioural entities inheritance relations."
	tColumnsContainer <|-- view.
	queryContainer <|-- view.
	tNamedEntity <|-- view.
	tColumnsContainer <|-- derivedTable.
	queryContainer <|-- derivedTable.
	queryContainer <|-- storedProcedure.
	tNamedEntity <|-- storedProcedure.
	storedProcedure <|-- triggerStoredProcedure.
	behaviouralEntity <|-- trigger.
	tNamedEntity <|-- trigger.
	crudQuery <|-- selectQuery.
	crudQuery <|-- insertQuery.
	crudQuery <|-- updateQuery.
	crudQuery <|-- deleteQuery.
	leafEntity <|-- parameter.
	tNamedEntity <|-- parameter.
	leafEntity <|-- localVariable.
	tNamedEntity <|-- localVariable.
	"Concrete reference entities inheritance relations."
	reference <|-- tableReference.
	reference <|-- derivedTableReference.
	reference <|-- viewReference.
	reference <|-- leafAccess.
	reference <|-- columnReference.
	reference <|-- typeReference.
	reference <|-- storedProcedureCall