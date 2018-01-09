definitions - SQL
defineSQLMetaModelEntities
	"Abstract entities."
	relationalEntity := builder newClassNamed: #RelationalEntity.
	query := builder newClassNamed: #Query.
	"Concrete entities."
	database := builder newClassNamed: #Database.
	table := builder newClassNamed: #Table.
	column := builder newClassNamed: #Column.
	view := builder newClassNamed: #View.
	function := builder newClassNamed: #Function.
	trigger := builder newClassNamed: #Trigger.
	expression := builder newClassNamed: #Expression.
	selectQuery := builder newClassNamed: #SelectQuery.
	insertQuery := builder newClassNamed: #InsertQuery.
	updateQuery := builder newClassNamed: #UpdateQuery.
	deleteQuery := builder newClassNamed: #DeleteQuery.
	constraint := builder newClassNamed: #Constraint.
	sequence := builder newClassNamed: #Sequence.
	dataType := builder newClassNamed: #DataType.
	"rewriteRule := builder newClassNamed: #RewriteRule.
	aggregate := builder newClassNamed: #Aggregate."
	
