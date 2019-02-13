convenient linking
linkReferencedEntities: aSRIdentifierWithNode
	self flag: #TODO.	"add position in source"
	aSRIdentifierWithNode entity
		ifNotNil: [ self createReferenceTo: aSRIdentifierWithNode entity from: aSRIdentifierWithNode node ].
	aSRIdentifierWithNode isLast
		ifFalse: [ self linkReferencedEntities: aSRIdentifierWithNode next ]