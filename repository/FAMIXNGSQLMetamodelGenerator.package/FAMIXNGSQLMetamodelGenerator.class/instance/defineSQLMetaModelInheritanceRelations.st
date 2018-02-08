definitions - SQL
defineSQLMetaModelInheritanceRelations
	"Abstract entities inheritance relations."
	namedEntity <|-- structuralEntity.
	structuralEntity <|-- constraint.
	structuralEntity <|-- columnsContainer.
	behaviouralEntity <|-- queryContainer.
	queryContainer <|-- crudQuery.
	sourcedEntity <|-- reference.
	"Concrete structural entities inheritance relations."
	columnsContainer <|-- table.
	structuralEntity <|-- column.
	structuralEntity <|-- type.
	behaviouralEntity <|-- checkConstraint.
	constraint <|-- checkConstraint.
	constraint <|-- primaryKeyConstraint.
	constraint <|-- foreignKeyConstraint.
	constraint <|-- notNullConstraint.
	constraint <|-- uniqueConstraint.
	"Concrete behavioural entities inheritance relations."
	columnsContainer <|-- view.
	queryContainer <|-- view.
	queryContainer <|-- storedProcedure.
	storedProcedure <|-- triggerStoredProcedure.
	behaviouralEntity <|-- trigger.
	crudQuery <|-- selectQuery.
	crudQuery <|-- insertQuery.
	crudQuery <|-- updateQuery.
	crudQuery <|-- deleteQuery.
	leafEntity <|-- parameter.
	leafEntity <|-- localVariable.
	"Concrete reference entities inheritance relations."
	reference <|-- tableReference.
	reference <|-- leafAccess.
	reference <|-- columnReference.
	reference <|-- typeReference.
	reference <|-- storedProcedureCall