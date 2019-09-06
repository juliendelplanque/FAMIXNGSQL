"
I am an into clause
"
Class {
	#name : #FmxSQLIntoClause,
	#superclass : #FmxSQLClause,
	#traits : 'FmxSQLTWithColumnReference + FmxSQLTWithTableReference',
	#classTraits : 'FmxSQLTWithColumnReference classTrait + FmxSQLTWithTableReference classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLIntoClause class >> annotation [

	<MSEClass: #IntoClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]
