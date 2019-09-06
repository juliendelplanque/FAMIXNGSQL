Class {
	#name : #FmxSQLSourcedEntity,
	#superclass : #FmxSQLEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait',
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]
