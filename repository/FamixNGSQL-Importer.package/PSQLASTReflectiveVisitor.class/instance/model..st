accessing
model: anObject
	model := anObject.
	self initialiseSolver.
	self
		pushEntitiesAsScope: (model allWithType: FmxSQLTable) , (model allWithType: FmxSQLView)