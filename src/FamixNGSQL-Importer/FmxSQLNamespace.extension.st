Extension { #name : #FmxSQLNamespace }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLNamespace >> createReferenceEntityFrom: aFmxSQLEntity [ 
	^ FmxSQLNamespaceReference new
		namespace: self;
		source: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLNamespace >> reachableEntities [
	^ self namespaceEntities
]
