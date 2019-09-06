"
I am an using clause
"
Class {
	#name : #FmxSQLUsingClause,
	#superclass : #FmxSQLClause,
	#traits : 'FmxSQLTWithTableReference',
	#classTraits : 'FmxSQLTWithTableReference classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLUsingClause class >> annotation [

	<MSEClass: #UsingClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]
