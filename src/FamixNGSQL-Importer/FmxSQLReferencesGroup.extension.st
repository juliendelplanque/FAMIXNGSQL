Extension { #name : #FmxSQLReferencesGroup }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLReferencesGroup >> aliasClass [
	^ FmxSQLColumnAlias
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLReferencesGroup >> createReferenceEntityFrom: aFmxSQLEntity [
	^ FmxSQLReferencesGroupReference new
		referencesGroup: self;
		source: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself.
]
