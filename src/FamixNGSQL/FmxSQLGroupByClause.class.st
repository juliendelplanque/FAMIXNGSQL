"
I am a group by clause
"
Class {
	#name : #FmxSQLGroupByClause,
	#superclass : #FmxSQLClause,
	#traits : 'FamixTWithAccesses + FamixTWithInvocations + FmxSQLTWithColumnReference + FmxSQLTWithNamespaceReference + FmxSQLTWithReferencesGroupReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithNamespaceReference classTrait + FmxSQLTWithReferencesGroupReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLGroupByClause class >> annotation [

	<MSEClass: #GroupByClause super: #FmxSQLClause>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLGroupByClause >> isClauseAbleToReferenceColumn [
	^ true
]

{ #category : #testing }
FmxSQLGroupByClause >> isGroupByClause [

	<generated>
	^ true
]
