visiting
visitPSQLASTIdentifier: aPSQLASTIdentifier
	| identifier |
	identifier := aPSQLASTIdentifier identifier.
	^ (identifier first = $" and: identifier last = $")
		ifTrue: [ identifier withoutQuoting ]
		ifFalse: [ identifier asLowercase ]