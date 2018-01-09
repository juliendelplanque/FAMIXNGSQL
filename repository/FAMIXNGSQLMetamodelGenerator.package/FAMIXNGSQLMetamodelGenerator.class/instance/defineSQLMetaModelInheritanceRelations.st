definitions - SQL
defineSQLMetaModelInheritanceRelations
	"NamedEntity's inheritance sub-entities."
	namedEntity <|-- relationalEntity.
	namedEntity <|-- database.
	"RelationalEntity's inheritance sub-entities."
	relationalEntity <|-- table.
	relationalEntity <|-- column.
	relationalEntity <|-- sequence.
	relationalEntity <|-- trigger.
	relationalEntity <|-- expression.
	"Table's inheritance sub-entities."
	table <|-- view.
	behaviouralEntity <|-- function.
	entity <|-- query.
	"Query's inheritance sub-entities."
	query <|-- selectQuery.
	query <|-- insertQuery.
	query <|-- updateQuery.
	query <|-- deleteQuery.
	behaviouralEntity <|-- constraint.
	type <|-- dataType.
	"behaviouralEntity <|-- rewriteRule.
	behaviouralEntity <|-- aggregate."
	
