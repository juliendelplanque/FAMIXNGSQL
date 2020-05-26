"
I am a set clause
"
Class {
	#name : #FmxSQLSetClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithAccesses + FamixTWithInvocations + FmxSQLTWithColumnReference + FmxSQLTWithDerivedTableReference',
	#classTraits : 'FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithDerivedTableReference classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLSetClause class >> annotation [

	<MSEClass: #SetClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLSetClause >> isClauseAbleToReferenceColumn [
	^ true
]

{ #category : #testing }
FmxSQLSetClause >> isSetClause [

	<generated>
	^ true
]
