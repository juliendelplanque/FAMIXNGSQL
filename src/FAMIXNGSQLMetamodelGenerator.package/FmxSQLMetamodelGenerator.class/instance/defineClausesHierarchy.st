definition - behavioural
defineClausesHierarchy
	"Defining all kinds of clauses"
	clause --|> entity.
	clause --|> tWithAlias.
	clause --|> #TWithSourceAnchor.
	clause --|> #TEntityMetaLevelDependency.
	clause --|> #TDependencyQueries.
	
	fromClause --|> clause.
	fromClause --|> tWithTableReference.
	fromClause --|> tWithViewReference. "For view.column ref."
	fromClause --|> tWithDerivedTableReference.
	fromClause --|> tWithColumnReference. "Because of join clause"
	fromClause --|> tWithReferencesGroupReference.
	fromClause --|> #TWithAccesses. "Because of join clause"
	fromClause --|> #TWithInvocations. "Because of join clause"
	
	whereClause --|> clause.
	whereClause --|> tWithColumnReference.
	whereClause --|> #TWithAccesses.
	whereClause --|> #TWithInvocations.
	whereClause --|> tWithTableReference. "For table.column ref."
	whereClause --|> tWithViewReference. "For view.column ref."
	whereClause --|> tWithDerivedTableReference.
	whereClause --|> tWithReferencesGroupReference.
	
	returningClause --|> clause.
	returningClause --|> tWithColumnReference.
	returningClause --|> tWithReferencesGroupReference.
	returningClause --|> #TWithAccesses.
	returningClause --|> #TWithInvocations.
	
	setClause --|> clause.
	setClause --|> tWithDerivedTableReference.
	setClause --|> tWithColumnReference.
	setClause --|> #TWithAccesses.
	setClause --|> #TWithInvocations.
	
	selectClause --|> clause.
	selectClause --|> tWithColumnReference.
	selectClause --|> #TWithAccesses.
	selectClause --|> #TWithInvocations.
	selectClause --|> tWithTableReference. "Through table.column ref."
	selectClause --|> tWithDerivedTableReference. "For aliased_derived_table.column ref."
	selectClause --|> tWithViewReference. "For view.column ref."
	
	groupByClause --|> clause.
	groupByClause --|> tWithColumnReference.
	groupByClause --|> tWithTableReference. "For table.column ref."
	groupByClause --|> tWithViewReference. "For view.column ref."
	groupByClause --|> tWithReferencesGroupReference.
	groupByClause --|> #TWithAccesses.
	groupByClause --|> #TWithInvocations.
	
	havingClause --|> clause.
	havingClause --|> tWithColumnReference.
	havingClause --|> tWithTableReference. "For table.column ref."
	havingClause --|> tWithViewReference. "For view.column ref."
	havingClause --|> tWithReferencesGroupReference.
	havingClause --|> #TWithAccesses.
	havingClause --|> #TWithInvocations.
	
	orderByClause --|> clause.
	orderByClause --|> tWithColumnReference.
	orderByClause --|> tWithTableReference. "For table.column ref."
	orderByClause --|> tWithViewReference. "For view.column ref."
	orderByClause --|> tWithReferencesGroupReference.
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
	valuesClause --|> tWithDerivedTableReference.
	valuesClause --|> tWithColumnReference.
	valuesClause --|> #TWithAccesses.
	valuesClause --|> #TWithInvocations.
	
	usingClause --|> clause.
	usingClause --|> tWithTableReference.
	
	intoClause --|> clause.
	intoClause --|> tWithTableReference.
	intoClause --|> tWithColumnReference.
	
	limitClause --|> clause