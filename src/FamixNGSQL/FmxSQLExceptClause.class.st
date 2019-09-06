"
I am an except clause
"
Class {
	#name : #FmxSQLExceptClause,
	#superclass : #FmxSQLClause,
	#traits : 'FmxSQLTWithDerivedTableReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FmxSQLTWithDerivedTableReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLExceptClause class >> annotation [

	<MSEClass: #ExceptClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]
