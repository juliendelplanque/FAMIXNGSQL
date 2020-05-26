"
I am an access to an alias.
"
Class {
	#name : #FmxSQLAliasAccess,
	#superclass : #FmxSQLReference,
	#traits : 'FamixTAccess + FmxSQLTWithQualifiedReference',
	#classTraits : 'FamixTAccess classTrait + FmxSQLTWithQualifiedReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLAliasAccess class >> annotation [

	<MSEClass: #AliasAccess super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLAliasAccess >> isAliasAccess [

	<generated>
	^ true
]
