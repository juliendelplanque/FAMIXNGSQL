convenient linking
createReferenceTo: anEntity from: aPSQLASTNode
	| anchor |
	anchor := self createSourceAnchorFrom: aPSQLASTNode.
	(anEntity value createReferenceEntityFrom: self currentEntity)
		sourceAnchor: anchor;
		mooseModel: self model;
		yourself