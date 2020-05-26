Extension { #name : #SqlTriggerFunction }

{ #category : #'*FamixNGSQL-Importer' }
SqlTriggerFunction >> ast [
	^ PostgreSQLParser parseStoredProcedureBody: self code
]
