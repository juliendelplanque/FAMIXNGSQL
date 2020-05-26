"
I am a derived table. A derived table is a temporary table created to store temporarily the results of a sub-select query in a select query. Such tables are not globally named as a Tableor a View because they can not be accessed outside the query in which they are computed (which is also the query defining them). Nonetheless, they can get an alias to be referenced inside the query. .
"
Class {
	#name : #FmxSQLDerivedTable,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FmxSQLBehaviouralEntity + FmxSQLColumnsContainer + FmxSQLTQueryContainer',
	#classTraits : 'FmxSQLBehaviouralEntity classTrait + FmxSQLColumnsContainer classTrait + FmxSQLTQueryContainer classTrait',
	#instVars : [
		'#query => FMOne type: #FmxSQLCRUDQuery opposite: #derivedTableDefining',
		'#parentQuery => FMOne type: #FmxSQLTDefiningDerivedTables opposite: #derivedTablesDefined',
		'#references => FMMany type: #FmxSQLDerivedTableReference opposite: #derivedTable'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLDerivedTable class >> annotation [

	<MSEClass: #DerivedTable super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLDerivedTable class >> requirements [

	<generated>
	^ { FmxSQLDeleteQuery. FmxSQLInsertQuery. FmxSQLSelectQuery. FmxSQLUpdateQuery }
]

{ #category : #accessing }
FmxSQLDerivedTable >> belongsTo [

	<generated>
	^ self parentQuery

]

{ #category : #accessing }
FmxSQLDerivedTable >> belongsTo: anObject [

	<generated>
	self parentQuery: anObject

]

{ #category : #testing }
FmxSQLDerivedTable >> isAnyBelongerSourced [
	^ self parentQuery isAnyBelongerSourced
]

{ #category : #accessing }
FmxSQLDerivedTable >> parentQuery [
	"Relation named: #parentQuery type: #FmxSQLTDefiningDerivedTables opposite: #derivedTablesDefined"

	<generated>
	<container>
	^ parentQuery
]

{ #category : #accessing }
FmxSQLDerivedTable >> parentQuery: anObject [

	<generated>
	parentQuery := anObject

]

{ #category : #navigation }
FmxSQLDerivedTable >> parentQueryGroup [
	<generated>
	<navigation: 'ParentQuery'>
	^ MooseGroup with: self parentQuery
]

{ #category : #accessing }
FmxSQLDerivedTable >> query [
	"Relation named: #query type: #FmxSQLCRUDQuery opposite: #derivedTableDefining"

	<generated>
	^ query
]

{ #category : #accessing }
FmxSQLDerivedTable >> query: anObject [

	<generated>
	query := anObject

]

{ #category : #navigation }
FmxSQLDerivedTable >> queryGroup [
	<generated>
	<navigation: 'Query'>
	^ MooseGroup with: self query
]

{ #category : #accessing }
FmxSQLDerivedTable >> references [
	"Relation named: #references type: #FmxSQLDerivedTableReference opposite: #derivedTable"

	<generated>
	^ references
]

{ #category : #accessing }
FmxSQLDerivedTable >> references: anObject [

	<generated>
	references value: anObject

]

{ #category : #accessing }
FmxSQLDerivedTable >> sourcedBelonger [
	^ self parentQuery sourcedBelonger
]
