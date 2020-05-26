Extension { #name : #FmxSQLColumn }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumn >> aliasClass [
	^ FmxSQLColumnAlias
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumn >> createReferenceEntityFrom: aFmxSQLEntity [
	^ FmxSQLColumnReference new
		column: self;
		source: aFmxSQLEntity;
		isWildCardReference: false;
		isCertain: true;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumn >> reachableEntities [
	^ #()
]
