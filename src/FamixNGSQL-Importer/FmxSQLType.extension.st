Extension { #name : #FmxSQLType }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLType >> reachableEntities [
	self flag: #TODO. "Types can be defined with contained fields"
	^ #()
]
