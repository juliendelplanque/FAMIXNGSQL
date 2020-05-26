Class {
	#name : #FmxSQLColumnAliasAccess,
	#superclass : #FmxSQLReference,
	#traits : 'FamixTAccess + FmxSQLTWithQualifiedReference',
	#classTraits : 'FamixTAccess classTrait + FmxSQLTWithQualifiedReference classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLColumnAliasAccess class >> annotation [

	<MSEClass: #ColumnAliasAccess super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]
