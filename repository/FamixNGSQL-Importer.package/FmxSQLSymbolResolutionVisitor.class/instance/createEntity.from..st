entity creation
createEntity: anEntityClass from: aPSQLASTNode 
	self flag: #todo. "Should set source anchors."
	^ self createEntity: anEntityClass 