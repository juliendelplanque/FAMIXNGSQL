definitions - SQL
defineSQLMetaModelInheritanceRelations
	"Abstract entities inheritance relations."
	tNamedEntity <|-- structuralEntity.
	structuralEntity <|-- constraint.
	behaviouralEntity <|-- queryContainer.
	queryContainer <|-- crudQuery.
	sourcedEntity <|-- reference.
	"Concrete structural entities inheritance relations."
	structuralEntity <|-- table.
	tColumnsContainer <|-- table.
	structuralEntity <|-- column.
	structuralEntity <|-- type.
	behaviouralEntity <|-- checkConstraint.
	constraint <|-- checkConstraint.
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