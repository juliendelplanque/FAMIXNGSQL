visiting - convenience
visitExpression: anExpressionNode
	self flag: #TODO. "Temporary. Quite sure to put that in the top of the context pile"
	^ self visit: anExpressionNode thenDo: [ :res | res ]