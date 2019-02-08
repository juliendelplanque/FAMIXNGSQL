accessing
entity: anObject
	self assert: anObject isNotNil.
	self assert: anObject class ~= PSQLASTReflectiveVisitor.
	self assert: anObject class ~= SREntityScope.
	entity := anObject