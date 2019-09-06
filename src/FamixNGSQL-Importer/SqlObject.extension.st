Extension { #name : #SqlObject }

{ #category : #'*FamixNGSQL-Importer' }
SqlObject >> ast [
	^ nil
]

{ #category : #'*FamixNGSQL-Importer' }
SqlObject >> hasAst [
	^ self ast isNotNil
]
