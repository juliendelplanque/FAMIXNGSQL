"
TODO
"
Class {
	#name : #FmxSQLReferencesGroupReference,
	#superclass : #FmxSQLReference,
	#traits : 'FmxSQLTReferencesGroupReference + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FmxSQLTReferencesGroupReference classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLReferencesGroupReference class >> annotation [

	<MSEClass: #ReferencesGroupReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLReferencesGroupReference class >> requirements [

	<generated>
	^ { FmxSQLColumnAlias. FmxSQLFromClause. FmxSQLGroupByClause. FmxSQLHavingClause. FmxSQLOrderByClause. FmxSQLReturningClause. FmxSQLWhereClause }
]

{ #category : #accessing }
FmxSQLReferencesGroupReference >> belongsTo [

	<generated>
	^ self source

]

{ #category : #accessing }
FmxSQLReferencesGroupReference >> belongsTo: anObject [

	<generated>
	self source: anObject

]

{ #category : #accessing }
FmxSQLReferencesGroupReference >> from [
	^ self source
]

{ #category : #accessing }
FmxSQLReferencesGroupReference >> to [
	^ self referencesGroup
]
