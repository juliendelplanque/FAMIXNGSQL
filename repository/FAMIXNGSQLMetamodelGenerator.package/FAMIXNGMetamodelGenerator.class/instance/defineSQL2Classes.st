initialization
defineSQL2Classes

	relationalEntity := builder newClassNamed: #RelationalEntity.
	namedEntity <|-- relationalEntity.
	
	table := builder newClassNamed: #Table.
	relationalEntity <|-- table.

	column := builder newClassNamed: #Column.
	relationalEntity <|-- column.	
	
	view := builder newClassNamed: #View.
	table <|-- view.

	function := builder newClassNamed: #Function.
	behaviouralEntity <|-- function.
	
	trigger := builder newClassNamed: #Trigger.
	relationalEntity <|-- trigger.

	expression := builder newClassNamed: #Expression.
	relationalEntity <|-- expression.

	query := builder newClassNamed: #Query.
	entity <|-- query.

	selectQuery := builder newClassNamed: #SelectQuery.
	query <|-- selectQuery.

	insertQuery := builder newClassNamed: #InsertQuery.
	query <|-- insertQuery.
	
	updateQuery := builder newClassNamed: #UpdateQuery.
	query <|-- updateQuery.
	
	deleteQuery := builder newClassNamed: #DeleteQuery.
	query <|-- deleteQuery.
	
	constraint := builder newClassNamed: #Constraint.
	behaviouralEntity <|-- constraint.
	
	sequence := builder newClassNamed: #Sequence.
	relationalEntity <|-- sequence.
	
	dataType := builder newClassNamed: #DataType.
	type <|-- dataType.
	
	rewriteRule := builder newClassNamed: #RewriteRule.
	behaviouralEntity <|-- rewriteRule.
	
	aggregate := builder newClassNamed: #Aggregate.
	behaviouralEntity <|-- aggregate.
	
