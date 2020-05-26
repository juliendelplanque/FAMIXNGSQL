"
I am an except clause
"
Class {
	#name : #FmxSQLExceptClause,
	#superclass : #FmxSQLClause,
	#traits : 'FmxSQLTWithDerivedTableReference + FmxSQLTWithNamespaceReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FmxSQLTWithDerivedTableReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLExceptClause class >> annotation [

	<MSEClass: #ExceptClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLExceptClause >> isExceptClause [

	<generated>
	^ true
]
