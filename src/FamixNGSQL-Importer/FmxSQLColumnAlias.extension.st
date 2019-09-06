Extension { #name : #FmxSQLColumnAlias }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumnAlias >> reachableEntities [
	^ (self outgoingColumnReferences , self outgoingReferencesGroupReferences)
			flatCollect: [ :link | link to reachableEntities ]
]
