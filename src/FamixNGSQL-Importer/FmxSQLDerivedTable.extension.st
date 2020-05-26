Extension { #name : #FmxSQLDerivedTable }

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLDerivedTable >> aliasClass [
	^ FmxSQLColumnsContainerAlias
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLDerivedTable >> createReferenceEntityFrom: aFmxSQLEntity [
	^ FmxSQLDerivedTableReference new
		derivedTable: self;
		source: aFmxSQLEntity;
		mooseModel: aFmxSQLEntity mooseModel;
		yourself.
]

{ #category : #'*FamixNGSQL-Importer' }
FmxSQLDerivedTable >> reachableEntities [
	"This first part gets aliased columns defined by the query."
	| selectClause |
	selectClause := (self query ifNil: [ ^ #() ]) clauses detect: [ :c | c class = FmxSQLSelectClause ] ifNone: [ ^ #() ].
	^ selectClause aliases , 
	(selectClause columnsReferencedExceptNames: (selectClause aliases collect: #name))
]
