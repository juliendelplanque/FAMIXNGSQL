Extension { #name : #FmxSQLColumnReference }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumnReference >> from [
	^ self source ifNil: [ self foreignKeyConstraintSource ]
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumnReference >> reference [
	^ self column
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLColumnReference >> to [
	^ self column
]
