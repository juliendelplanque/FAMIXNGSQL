"
I am a where clause
"
Class {
	#name : #FmxSQLWhereClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithAccesses + FamixTWithInvocations + FmxSQLTWithColumnReference + FmxSQLTWithDerivedTableReference + FmxSQLTWithReferencesGroupReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithDerivedTableReference classTrait + FmxSQLTWithReferencesGroupReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLWhereClause class >> annotation [

	<MSEClass: #WhereClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLWhereClause >> isClauseAbleToReferenceColumn [
	^ true
]

{ #category : #testing }
FmxSQLWhereClause >> isWhereClause [

	<generated>
	^ true
]
