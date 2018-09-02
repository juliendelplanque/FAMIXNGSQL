visiting
visitPSQLASTConditionalExpression: aPSQLASTConditionalExpression
	aPSQLASTConditionalExpression conditionsToExpressions
		do: [ :aConditionToExpresion | 
			self visitExpression: aConditionToExpresion key.
			self visitExpression: aConditionToExpresion value ].
	self visitExpression: aPSQLASTConditionalExpression elseExpression