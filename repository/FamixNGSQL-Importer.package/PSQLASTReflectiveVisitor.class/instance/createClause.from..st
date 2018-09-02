convenient
createClause: aClauseClass from: aPSQLASTClauseNode
	^ (self createEntity: aClauseClass from: aPSQLASTClauseNode)
		query: self currentEntity;
		yourself