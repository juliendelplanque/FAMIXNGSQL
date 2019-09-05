*FamixNGSQL-Extensions
isForeignKey
	self deprecated: 'Use #isForeignKeyConstraint instead.' transformWith: '`@receiver isForeignKey' -> '`@receiver isForeignKeyConstraint'.
	^ self isForeignKeyConstraint