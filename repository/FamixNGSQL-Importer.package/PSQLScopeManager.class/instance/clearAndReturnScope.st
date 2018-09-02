clearing
clearAndReturnScope
	| compositeScope |
	compositeScope := PSQLCompositeScope withScopes: self addedScopes.
	self clear.
	^ compositeScope