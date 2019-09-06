"
I am an abstract superclass for structural entities. A structural entity is an entity that defines how data are structured by the database.
"
Class {
	#name : #FmxSQLStructuralEntity,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTNamespaceEntity',
	#classTraits : 'FamixTNamespaceEntity classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLStructuralEntity class >> annotation [

	<MSEClass: #StructuralEntity super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]
