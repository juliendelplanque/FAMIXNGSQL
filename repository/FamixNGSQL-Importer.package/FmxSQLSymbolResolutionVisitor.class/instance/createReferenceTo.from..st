convenient linking
createReferenceTo: anEntity from: aPSQLASTNode
	| anchor reference |
	anchor := self createSourceAnchorFrom: aPSQLASTNode.
	reference := (anEntity value createReferenceEntityFrom: self currentEntity)
		sourceAnchor: anchor;
		mooseModel: self model;
		yourself.
		
	reference class = FmxSQLColumnReference
		ifTrue: [ reference isWildCardReference: aPSQLASTNode isWildCard ]