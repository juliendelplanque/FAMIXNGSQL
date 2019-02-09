visiting
visitPSQLASTInsertQuery: aPSQLASTInsertQuery
	| insertQuery |
	insertQuery := self createQueryContainedByCurrentEntity: FmxSQLInsertQuery from: aPSQLASTInsertQuery.
	^ self
		useCurrentEntity: insertQuery
		during: [ self
				useCurrentEntity: (self createClause: FmxSQLIntoClause from: aPSQLASTInsertQuery tableName)
				during: [ self
						visit: aPSQLASTInsertQuery tableName
						thenDo: [ :visitResult | self createReferenceTo: (self findTableOrViewNamed: visitResult) ].
					"The into clause add the table scope but only for the columns visit"
					self visitAll: aPSQLASTInsertQuery columns ].
			self visit: aPSQLASTInsertQuery withClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTInsertQuery returningClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTInsertQuery onConflictClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTInsertQuery valuesClause.
			self visit: aPSQLASTInsertQuery alias thenDo: [ :visitResult | Halt now ] ]