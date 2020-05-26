Extension { #name : #FmxSQLView }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLView >> aliasClass [
	^ FmxSQLColumnsContainerAlias
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLView >> createReferenceEntityFrom: aFmxSQLEntity [
	^ FmxSQLViewReference new
		view: self;
		source: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself
]
