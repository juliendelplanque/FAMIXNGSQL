Extension { #name : #FmxSQLEntity }

{ #category : #'*FAMIXNGSQLAnalysis' }
FmxSQLEntity >> concept [
	^ (self privateState
		attributeAt: #concept
		ifAbsent: [ nil ]) ifNil: [ self error: 'No concept set for this entity.' ]
]

{ #category : #'*FAMIXNGSQLAnalysis' }
FmxSQLEntity >> concept: aConcept [
	self privateState
		attributeAt: #concept
		put: aConcept
]

{ #category : #'*FAMIXNGSQLAnalysis' }
FmxSQLEntity >> conceptDependencies [
	| dependencies |
	dependencies := self dependenciesForConcepts.
	
	^ (dependencies allSatisfy: #hasConcept)
		ifTrue: [ dependencies collect: #concept as: Set ]
		ifFalse: [ self error: 'Not all dependencies have their concept set.' ]
]

{ #category : #'*FAMIXNGSQLAnalysis' }
FmxSQLEntity >> dependenciesForConcepts [
	^ ((self queryAllOutgoing allAtAnyScope: { FmxSQLTable. FmxSQLView. FmxSQLStoredProcedure. FmxSQLTrigger. FmxSQLTriggerStoredProcedure }) \ {self}) reject: [ :e | e isStub or: [ e parentNamespace name = 'pg_catalog' ] ]
]

{ #category : #'*FAMIXNGSQLAnalysis' }
FmxSQLEntity >> hasConcept [
	^( self privateState
		attributeAt: #concept
		ifAbsent: [ nil ]) isNotNil.
]

{ #category : #'*FAMIXNGSQLAnalysis' }
FmxSQLEntity >> resetConcept [
	self privateState
		attributeAt: #concept put: nil
]
