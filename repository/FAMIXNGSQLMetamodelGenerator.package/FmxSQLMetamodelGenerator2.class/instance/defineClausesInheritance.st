definition
defineClausesInheritance
	"Defining all kinds of clauses"
	fromClause --|> clause.
	fromClause --|> tWithTableReference.
	fromClause --|> tWithDerivedTableReference.
	
	whereClause --|> clause.
	whereClause --|> tWithColumnReference.
	whereClause --|> #TWithAccesses.
	whereClause --|> #TWithInvocations.
	
	returningClause --|> clause.
	returningClause --|> tWithColumnReference.
	returningClause --|> #TWithAccesses.
	returningClause --|> #TWithInvocations.
	
	setClause --|> clause.
	setClause --|> tWithColumnReference.
	setClause --|> #TWithAccesses.
	setClause --|> #TWithInvocations.
	
	selectClause --|> clause.
	selectClause --|> tWithColumnReference.
	selectClause --|> #TWithAccesses.
	selectClause --|> #TWithInvocations.
	
	groupByClause --|> clause.
	groupByClause --|> tWithColumnReference.
	groupByClause --|> #TWithAccesses.
	groupByClause --|> #TWithInvocations.
	
	havingClause --|> clause.
	havingClause --|> tWithColumnReference.
	havingClause --|> #TWithAccesses.
	havingClause --|> #TWithInvocations.
	
	orderByClause --|> clause.
	orderByClause --|> tWithColumnReference.
	orderByClause --|> #TWithAccesses.
	orderByClause --|> #TWithInvocations.
	
	onConflictClause --|> clause.
	
	withClause --|> clause.
	
	joinClause --|> clause.
	
	unionClause --|> clause.
	
	intersectClause --|> clause.
	
	exceptClause --|> clause.
	
	valuesClause --|> clause.
	
	usingClause --|> clause.
	
	intoClause --|> clause.
	
	limitClause --|> clause