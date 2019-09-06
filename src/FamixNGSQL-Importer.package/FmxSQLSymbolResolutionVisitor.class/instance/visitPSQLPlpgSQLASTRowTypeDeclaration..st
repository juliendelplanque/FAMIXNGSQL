visiting
visitPSQLPlpgSQLASTRowTypeDeclaration: aPSQLPlpgSQLASTRowTypeDeclaration
	^ FmxSQLLocalVariable new
		name: (aPSQLPlpgSQLASTRowTypeDeclaration identifier acceptVisitor: self);
		type: (self findTableOrViewNamed: (aPSQLPlpgSQLASTRowTypeDeclaration tableIdentifier acceptVisitor: self));
		storedProcedure: function;
		mooseModel: model;
		yourself