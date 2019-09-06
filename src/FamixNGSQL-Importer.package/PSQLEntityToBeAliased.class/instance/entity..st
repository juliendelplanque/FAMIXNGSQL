accessing
entity: anObject
	self assert: anObject isNotNil.
	self assert: anObject class ~= FmxSQLSymbolResolutionVisitor.
	self assert: anObject class ~= SREntityScope.
	entity := anObject