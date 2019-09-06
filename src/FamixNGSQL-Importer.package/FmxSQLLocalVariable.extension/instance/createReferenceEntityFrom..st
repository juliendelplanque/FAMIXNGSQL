*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	aFmxSQLEntity class = PSQLASTIgnoredLocalVariableNullObject
		ifTrue: [ ^ self ].
	
	^ FmxSQLLocalVariableAccess new
		localVariable: self;
		accessor: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself