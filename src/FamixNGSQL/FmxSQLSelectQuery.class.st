"
I am a SELECT query.
"
Class {
	#name : #FmxSQLSelectQuery,
	#superclass : #FmxSQLCRUDQuery,
	#traits : 'FmxSQLTDefiningDerivedTables',
	#classTraits : 'FmxSQLTDefiningDerivedTables classTrait',
	#instVars : [
		'#viewDefining => FMOne type: #FmxSQLView opposite: #query',
		'#recordLocalVariables => FMMany type: #FmxSQLRecordLocalVariable opposite: #queryBoundTo'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLSelectQuery class >> annotation [

	<MSEClass: #SelectQuery super: #FmxSQLCRUDQuery>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLSelectQuery class >> requirements [

	<generated>
	^ { FmxSQLView }
]

{ #category : #accessing }
FmxSQLSelectQuery >> recordLocalVariables [
	"Relation named: #recordLocalVariables type: #FmxSQLRecordLocalVariable opposite: #queryBoundTo"

	<generated>
	^ recordLocalVariables
]

{ #category : #accessing }
FmxSQLSelectQuery >> recordLocalVariables: anObject [

	<generated>
	recordLocalVariables value: anObject

]

{ #category : #accessing }
FmxSQLSelectQuery >> selectClause [
	^ self clauses detect: [ :clause | clause class = FmxSQLSelectClause ]
]

{ #category : #accessing }
FmxSQLSelectQuery >> viewDefining [
	"Relation named: #viewDefining type: #FmxSQLView opposite: #query"

	<generated>
	<container>
	^ viewDefining
]

{ #category : #accessing }
FmxSQLSelectQuery >> viewDefining: anObject [

	<generated>
	viewDefining := anObject

]

{ #category : #navigation }
FmxSQLSelectQuery >> viewDefiningGroup [
	<generated>
	<navigation: 'ViewDefining'>
	^ MooseGroup with: self viewDefining
]
