*FamixNGSQL-Importer
reachableEntities
	"This first part gets aliased columns defined by the query."
	| selectClause |
	selectClause := (self query ifNil: [ ^ #() ]) clauses detect: [ :c | c class = FmxSQLSelectClause ] ifNone: [ ^ #() ].
	^ selectClause aliases , 
	(selectClause columnsReferencedExceptNames: (selectClause aliases collect: #name))