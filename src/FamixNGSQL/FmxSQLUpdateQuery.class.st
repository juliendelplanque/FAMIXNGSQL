"
I am an UPDATE query.
"
Class {
	#name : #FmxSQLUpdateQuery,
	#superclass : #FmxSQLCRUDQuery,
	#traits : 'FmxSQLTDefiningDerivedTables',
	#classTraits : 'FmxSQLTDefiningDerivedTables classTrait',
	#instVars : [
		'#table => FMOne type: #FmxSQLTable opposite: #updateQueries'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLUpdateQuery class >> annotation [

	<MSEClass: #UpdateQuery super: #FmxSQLCRUDQuery>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLUpdateQuery >> table [
	"Relation named: #table type: #FmxSQLTable opposite: #updateQueries"

	<generated>
	^ table
]

{ #category : #accessing }
FmxSQLUpdateQuery >> table: anObject [

	<generated>
	table := anObject

]
