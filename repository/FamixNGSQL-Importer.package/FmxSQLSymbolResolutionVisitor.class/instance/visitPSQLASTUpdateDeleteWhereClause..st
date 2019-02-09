visiting
visitPSQLASTUpdateDeleteWhereClause: aPSQLASTUpdateDeleteWhereClause
	| whereClause |
	whereClause := self createClause: FmxSQLWhereClause from: aPSQLASTUpdateDeleteWhereClause.
	self
		useCurrentEntity: whereClause
		during: [ self visit: aPSQLASTUpdateDeleteWhereClause condition.
			self visit: aPSQLASTUpdateDeleteWhereClause currentOfCursor ]