definition
defineClausesInheritance
	"Defining all kinds of clauses"
	fromClause --|> clause.
	fromClause --|> tWithTableReference.
	fromClause --|> tWithViewReference. "For view.column ref."
	fromClause --|> tWithDerivedTableReference.
	fromClause --|> tWithColumnReference. "Because of join clause"
	fromClause --|> #TWithAccesses. "Because of join clause"
	fromClause --|> #TWithInvocations. "Because of join clause"
	
	whereClause --|> clause.
	whereClause --|> tWithColumnReference.
	whereClause --|> #TWithAccesses.
	whereClause --|> #TWithInvocations.
	whereClause --|> tWithTableReference. "For table.column ref."
	whereClause --|> tWithViewReference. "For view.column ref."
	whereClause --|> tWithDerivedTableReference.
	
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
	selectClause --|> tWithTableReference. "Through table.column ref."
	selectClause --|> tWithViewReference. "For view.column ref."
	
	groupByClause --|> clause.
	groupByClause --|> tWithColumnReference.
	groupByClause --|> tWithTableReference. "For table.column ref."
	groupByClause --|> tWithViewReference. "For view.column ref."
	groupByClause --|> #TWithAccesses.
	groupByClause --|> #TWithInvocations.
	
	havingClause --|> clause.
	havingClause --|> tWithColumnReference.
	havingClause --|> tWithTableReference. "For table.column ref."
	havingClause --|> tWithViewReference. "For view.column ref."
	havingClause --|> #TWithAccesses.
	havingClause --|> #TWithInvocations.
	
	orderByClause --|> clause.
	orderByClause --|> tWithColumnReference.
	orderByClause --|> tWithTableReference. "For table.column ref."
	orderByClause --|> tWithViewReference. "For view.column ref."
	orderByClause --|> #TWithAccesses.
	orderByClause --|> #TWithInvocations.
	
	onConflictClause --|> clause.
	
	withClause --|> clause.
	
	joinClause --|> clause.
	
	unionClause --|> clause.
	unionClause --|> tWithDerivedTableReference.
	unionClause --|> tWithTableReference.
	unionClause --|> tWithViewReference.
	
	intersectClause --|> clause.
	intersectClause --|> tWithDerivedTableReference.
	intersectClause --|> tWithTableReference.
	intersectClause --|> tWithViewReference.
	
	exceptClause --|> clause.
	exceptClause --|> tWithDerivedTableReference.
	exceptClause --|> tWithTableReference.
	exceptClause --|> tWithViewReference.
	
	valuesClause --|> clause.
	
	usingClause --|> clause.
	
	intoClause --|> clause.
	
	limitClause --|> clause