*FamixNGSQL-Importer
reachableEntities
	"This first part gets aliased columns defined by the query."
	| selectClause |
	selectClause := (self query ifNil: [ ^ #() ]) clauses detect: [ :c | c class = FmxSQLSelectClause ] ifNone: [ ^ #() ].
	^ selectClause aliases , 
	"The next part gets the columns defined by the query that are not aliased."
	(selectClause columnsReferencedExceptNames: (selectClause aliases collect: #name))