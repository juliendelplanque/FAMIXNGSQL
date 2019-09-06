"
I am a returning clause
"
Class {
	#name : #FmxSQLReturningClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithAccesses + FamixTWithInvocations + FmxSQLTWithColumnReference + FmxSQLTWithReferencesGroupReference',
	#classTraits : 'FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithReferencesGroupReference classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLReturningClause class >> annotation [

	<MSEClass: #ReturningClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLReturningClause >> isClauseAbleToReferenceColumn [
	^ true
]
