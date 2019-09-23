"
I am an using clause
"
Class {
	#name : #FmxSQLUsingClause,
	#superclass : #FmxSQLClause,
	#traits : 'FmxSQLTWithDerivedTableReference + FmxSQLTWithTableReference',
	#classTraits : 'FmxSQLTWithDerivedTableReference classTrait + FmxSQLTWithTableReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLUsingClause class >> annotation [

	<MSEClass: #UsingClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLUsingClause >> isUsingClause [

	<generated>
	^ true
]
