visiting
visitPSQLASTSelectWhereClause: aPSQLASTSelectWhereClause
	| whereClause |
	whereClause := self createEntity: FmxSQLWhereClause from: aPSQLASTSelectWhereClause.
	whereClause query: self currentEntity.
	self
		useCurrentEntity: whereClause
		during: [ self visit: aPSQLASTSelectWhereClause condition ].
	^ whereClause