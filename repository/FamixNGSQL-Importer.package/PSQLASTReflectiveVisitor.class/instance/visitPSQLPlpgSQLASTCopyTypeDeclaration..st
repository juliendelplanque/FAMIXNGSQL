visiting
visitPSQLPlpgSQLASTCopyTypeDeclaration: aPSQLPlpgSQLASTCopyTypeDeclaration
	| variable |
	variable := self createEntity: FmxSQLLocalVariable from: aPSQLPlpgSQLASTCopyTypeDeclaration identifier.
	variable storedProcedure: self function.
	self visit: aPSQLPlpgSQLASTCopyTypeDeclaration accessToCopyType thenDo: [ :accessed | variable type: accessed type ].
	self visit: aPSQLPlpgSQLASTCopyTypeDeclaration identifier thenDo: [ :name | variable name: name ].
	^ variable