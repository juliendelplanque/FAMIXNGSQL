definition - behavioural
defineClausesEntities
	"Clause entities."

	clause := builder newClassNamed: #Clause comment: self clauseComment.
	withClause := builder
		newClassNamed: #WithClause
		comment: self withClauseComment.
	whereClause := builder
		newClassNamed: #WhereClause
		comment: self whereClauseComment.
	returningClause := builder
		newClassNamed: #ReturningClause
		comment: self returningClauseComment.
	onConflictClause := builder
		newClassNamed: #OnConflictClause
		comment: self conflictClauseComment.
	setClause := builder
		newClassNamed: #SetClause
		comment: self setClauseComment.
	fromClause := builder
		newClassNamed: #FromClause
		comment: self fromClauseComment.
	selectClause := builder
		newClassNamed: #SelectClause
		comment: self selectClauseComment.
	groupByClause := builder
		newClassNamed: #GroupByClause
		comment: self groupByClauseComment.
	havingClause := builder
		newClassNamed: #HavingClause
		comment: self havingClauseComment.
	orderByClause := builder
		newClassNamed: #OrderByClause
		comment: self orderByClauseComment.
	joinClause := builder
		newClassNamed: #JoinClause
		comment: self joinClauseComment.
	unionClause := builder
		newClassNamed: #UnionClause
		comment: self unionClauseComment.
	intersectClause := builder
		newClassNamed: #IntersectClause
		comment: self intersectClauseComment.
	exceptClause := builder
		newClassNamed: #ExceptClause
		comment: self exceptClauseComment.
	valuesClause := builder
		newClassNamed: #ValuesClause
		comment: self valuesClauseComment.
	usingClause := builder
		newClassNamed: #UsingClause
		comment: self usingClauseComment.
	intoClause := builder
		newClassNamed: #IntoClause
		comment: self intoClauseComment.
	limitClause := builder
		newClassNamed: #LimitClause
		comment: self limitClauseComment