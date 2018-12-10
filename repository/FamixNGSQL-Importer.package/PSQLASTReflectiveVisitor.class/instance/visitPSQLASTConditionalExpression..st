visiting
visitPSQLASTConditionalExpression: aPSQLASTConditionalExpression
	aPSQLASTConditionalExpression conditionsToExpressions
		do: [ :aConditionToExpresion | 
			self visitExpression: aConditionToExpresion condition.
			self visitExpression: aConditionToExpresion expression ].
	self visitExpression: aPSQLASTConditionalExpression elseExpression