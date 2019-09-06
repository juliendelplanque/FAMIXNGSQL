"
I am a select clause
"
Class {
	#name : #FmxSQLSelectClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithAccesses + FamixTWithInvocations + FmxSQLTWithColumnReference + FmxSQLTWithDerivedTableReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithDerivedTableReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLSelectClause class >> annotation [

	<MSEClass: #SelectClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLSelectClause >> isClauseAbleToReferenceColumn [
	^ true
]

{ #category : #testing }
FmxSQLSelectClause >> isSelectClause [

	<generated>
	^ true
]
