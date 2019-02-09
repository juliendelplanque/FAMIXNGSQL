convenient linking
linkReferencedEntities: aPSQIdentifierWithNode
	self flag: #TODO.	"add position in source"
	aPSQIdentifierWithNode entity
		ifNotNil: [ self createReferenceTo: aPSQIdentifierWithNode entity ].
	aPSQIdentifierWithNode isLast
		ifFalse: [ self linkReferencedEntities: aPSQIdentifierWithNode next ]