"
I am an union clause
"
Class {
	#name : #FmxSQLUnionClause,
	#superclass : #FmxSQLClause,
	#traits : 'FmxSQLTWithDerivedTableReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FmxSQLTWithDerivedTableReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLUnionClause class >> annotation [

	<MSEClass: #UnionClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]
