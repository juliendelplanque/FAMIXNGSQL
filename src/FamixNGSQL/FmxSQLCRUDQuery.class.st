"
I am an abstract superclass for Create Read Update Delete (CRUD) queries.

The Create query is the INSERT query in SQL.

The Read query is the SELECT query in SQL.

The Update query is the UPDATE query in SQL.

The Delete query is the DELETE query in SQL.

My subclasses represent these four queries.
"
Class {
	#name : #FmxSQLCRUDQuery,
	#superclass : #FmxSQLEntity,
	#traits : 'FamixTWithSourceAnchor + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTWithSourceAnchor classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#derivedTableDefining => FMOne type: #FmxSQLDerivedTable opposite: #query',
		'#clauses => FMMany type: #FmxSQLClause opposite: #query',
		'#container => FMOne type: #FmxSQLTQueryContainer opposite: #queries'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLCRUDQuery class >> annotation [

	<MSEClass: #CRUDQuery super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLCRUDQuery class >> requirements [

	<generated>
	^ { FmxSQLCursor. FmxSQLDerivedTable. FmxSQLStoredProcedure. FmxSQLView }
]

{ #category : #adding }
FmxSQLCRUDQuery >> addClauses: anObject [
	<generated>
	^ self clauses add: anObject
]

{ #category : #accessing }
FmxSQLCRUDQuery >> belongsTo [

	<generated>
	^ self container

]

{ #category : #accessing }
FmxSQLCRUDQuery >> belongsTo: anObject [

	<generated>
	self container: anObject

]

{ #category : #accessing }
FmxSQLCRUDQuery >> clauses [
	"Relation named: #clauses type: #FmxSQLClause opposite: #query"

	<generated>
	^ clauses
]

{ #category : #accessing }
FmxSQLCRUDQuery >> clauses: anObject [

	<generated>
	clauses value: anObject

]

{ #category : #navigation }
FmxSQLCRUDQuery >> clausesGroup [
	<generated>
	<navigation: 'Clauses'>
	^ MooseGroup withAll: self clauses asSet
]

{ #category : #accessing }
FmxSQLCRUDQuery >> container [
	"Relation named: #container type: #FmxSQLTQueryContainer opposite: #queries"

	<generated>
	<container>
	^ container
]

{ #category : #accessing }
FmxSQLCRUDQuery >> container: anObject [

	<generated>
	container := anObject

]

{ #category : #navigation }
FmxSQLCRUDQuery >> containerGroup [
	<generated>
	<navigation: 'Container'>
	^ MooseGroup with: self container
]

{ #category : #accessing }
FmxSQLCRUDQuery >> derivedTableDefining [
	"Relation named: #derivedTableDefining type: #FmxSQLDerivedTable opposite: #query"

	<generated>
	<container>
	^ derivedTableDefining
]

{ #category : #accessing }
FmxSQLCRUDQuery >> derivedTableDefining: anObject [

	<generated>
	derivedTableDefining := anObject

]

{ #category : #navigation }
FmxSQLCRUDQuery >> derivedTableDefiningGroup [
	<generated>
	<navigation: 'DerivedTableDefining'>
	^ MooseGroup with: self derivedTableDefining
]

{ #category : #testing }
FmxSQLCRUDQuery >> isAnyBelongerSourced [
	^ ({ FmxSQLView . FmxSQLStoredProcedure } anySatisfy: [ :any | self container isKindOf: any ])
			or: [ (self derivedTableDefining ifNotNil: #isAnyBelongerSourced ifNil: [ false ])
				or: [ self container isCursor and: [ { FmxSQLView . FmxSQLStoredProcedure } anySatisfy: [ :any | self container parentBehaviouralEntity isKindOf: any ] ] ] ]
]

{ #category : #accessing }
FmxSQLCRUDQuery >> sourcedBelonger [
	(self container isNotNil and: [ self container isCursor ])
		ifTrue: [ ^ self container parentBehaviouralEntity ].
	^ self container ifNil: [ self derivedTableDefining sourcedBelonger ]
]
