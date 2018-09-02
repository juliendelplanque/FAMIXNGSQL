instance creation
identifier: aStringIdentifier node: aPSQLASTIdentifier next: aNextPSQIdentifierWithNode
	^ self new
		identifier: aStringIdentifier;
		node: aPSQLASTIdentifier;
		next: aNextPSQIdentifierWithNode;
		yourself