entity creation
createSourceAnchorFrom: aPSQLASTNode
	^ (self createEntity: FmxSQLEntitySourceAnchor)
		start: aPSQLASTNode startPosition;
		end: aPSQLASTNode endPosition;
		entity:
			(self view
				ifNil: [ self function
						ifNil: [ self
								error: 'A view or a function should be set for symbol resolution.' ] ]);
		yourself