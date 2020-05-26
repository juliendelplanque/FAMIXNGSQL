"
I am an abstract clause
"
Class {
	#name : #FmxSQLClause,
	#superclass : #FmxSQLEntity,
	#traits : 'FamixTWithSourceAnchor + FmxSQLTWithAlias + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTWithSourceAnchor classTrait + FmxSQLTWithAlias classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#query => FMOne type: #FmxSQLCRUDQuery opposite: #clauses'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLClause class >> annotation [

	<MSEClass: #Clause super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLClause class >> requirements [

	<generated>
	^ { FmxSQLCRUDQuery }
]

{ #category : #accessing }
FmxSQLClause >> belongsTo [

	<generated>
	^ self query

]

{ #category : #accessing }
FmxSQLClause >> belongsTo: anObject [

	<generated>
	self query: anObject

]

{ #category : #testing }
FmxSQLClause >> isAnyBelongerSourced [
	^ self query isAnyBelongerSourced
]

{ #category : #accessing }
FmxSQLClause >> query [
	"Relation named: #query type: #FmxSQLCRUDQuery opposite: #clauses"

	<generated>
	<container>
	^ query
]

{ #category : #accessing }
FmxSQLClause >> query: anObject [

	<generated>
	query := anObject

]

{ #category : #navigation }
FmxSQLClause >> queryGroup [
	<generated>
	<navigation: 'Query'>
	^ MooseGroup with: self query
]

{ #category : #accessing }
FmxSQLClause >> sourcedBelonger [
	^ self query sourcedBelonger
]
