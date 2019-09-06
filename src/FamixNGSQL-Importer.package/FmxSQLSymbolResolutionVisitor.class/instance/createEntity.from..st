entity creation
createEntity: anEntityClass from: aPSQLASTNode
	| anchor |
	anchor := self createSourceAnchorFrom: aPSQLASTNode.
	^ (self createEntity: anEntityClass)
		sourceAnchor: anchor;
		yourself