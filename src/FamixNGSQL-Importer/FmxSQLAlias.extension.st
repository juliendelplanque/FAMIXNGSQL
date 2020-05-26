Extension { #name : #FmxSQLAlias }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLAlias >> createReferenceEntityFrom: aFmxSQLEntity [
	^ FmxSQLAliasAccess new
		variable: self;
		accessor: aFmxSQLEntity;
		isWrite: false;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself.
]
