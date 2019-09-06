Extension { #name : #FmxSQLRecordLocalVariable }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLRecordLocalVariable >> reachableEntities [
	| selectClause |
	selectClause := (self queryBoundTo ifNil: [ ^ #() ]) clauses detect: [ :c | c class = FmxSQLSelectClause ] ifNone: [ ^ #() ].
	^ selectClause aliases , 
	(selectClause columnsReferencedExceptNames: (selectClause aliases collect: #name))
]
