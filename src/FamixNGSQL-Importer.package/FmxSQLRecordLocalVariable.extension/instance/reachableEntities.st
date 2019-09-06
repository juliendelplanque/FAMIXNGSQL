*FamixNGSQL-Importer
reachableEntities
	| selectClause |
	selectClause := (self queryBoundTo ifNil: [ ^ #() ]) clauses detect: [ :c | c class = FmxSQLSelectClause ] ifNone: [ ^ #() ].
	^ selectClause aliases , 
	(selectClause columnsReferencedExceptNames: (selectClause aliases collect: #name))