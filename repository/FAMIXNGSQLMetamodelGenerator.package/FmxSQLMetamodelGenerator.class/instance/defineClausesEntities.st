definitions - SQL
defineClausesEntities
	"Clause entities."

	clause := builder newClassNamed: #Clause comment: 'I am an abstract clause'.
	withClause := builder newClassNamed: #WithClause comment: 'I am a with clause'.
	whereClause := builder newClassNamed: #WhereClause comment: 'I am a where clause'.
	returningClause := builder newClassNamed: #ReturningClause comment: 'I am a returning clause'.
	onConflictClause := builder newClassNamed: #OnConflictClause comment: 'I am a on conflict clause'.
	setClause := builder newClassNamed: #SetClause comment: 'I am a set clause'.
	fromClause := builder newClassNamed: #FromClause comment: 'I am a from clause'.
	selectClause := builder newClassNamed: #SelectClause comment: 'I am a select clause'.
	groupByClause := builder newClassNamed: #GroupByClause comment: 'I am a group by clause'.
	havingClause := builder newClassNamed: #HavingClause comment: 'I am a having clause'.
	orderByClause := builder newClassNamed: #OrderByClause comment: 'I am an order by clause'.
	joinClause := builder newClassNamed: #JoinClause comment: 'I am a join clause'.
	unionClause := builder newClassNamed: #UnionClause comment: 'I am an union clause'.
	intersectClause := builder newClassNamed: #IntersectClause comment: 'I am an intersect clause'.
	exceptClause := builder newClassNamed: #ExceptClause comment: 'I am an except clause'.
	valuesClause := builder newClassNamed: #ValuesClause comment: 'I am a Values clause'.
	usingClause := builder newClassNamed: #UsingClause comment: 'I am an using clause'.
	intoClause := builder newClassNamed: #IntoClause comment: 'I am an into clause'.
	limitClause := builder newClassNamed: #LimitClause comment: 'I am a limit clause'.
	
	"A clause is a reference container"
	tReferenceContainer <|-- clause.
	
	"Defining all kinds of clauses"	
	clause <|-- withClause.
	clause <|-- whereClause.
	clause <|-- returningClause.
	clause <|-- onConflictClause.
	clause <|-- setClause.
	clause <|-- fromClause.
	clause <|-- selectClause.
	clause <|-- groupByClause.
	clause <|-- havingClause.
	clause <|-- orderByClause.
	clause <|-- joinClause.
	clause <|-- unionClause.
	clause <|-- intersectClause.
	clause <|-- exceptClause.
	clause <|-- valuesClause.
	clause <|-- usingClause.
	clause <|-- intoClause.
	clause <|-- limitClause