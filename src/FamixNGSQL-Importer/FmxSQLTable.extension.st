Extension { #name : #FmxSQLTable }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLTable >> aliasClass [
	^ FmxSQLColumnsContainerAlias
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLTable >> createReferenceEntityFrom: aFmxSQLEntity [
	^ FmxSQLTableReference new
		table: self;
		source: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLTable >> reachableEntities [
	^ self columns , ((self queryIncoming: FmxSQLAliasAccess) collect: [ :access | access from ])
]
