testing
isPrimaryKey
	self deprecated: 'Use #isPrimaryKeyConstraint instead.' transformWith: '`@receiver isPrimaryKey' -> '`@receiver isPrimaryKeyConstraint'.
	^ self isPrimaryKeyConstraint