"
I am a namespace. I hold entities to define a name scope where name duplicates are forbidden.
"
Class {
	#name : #FmxSQLNamespace,
	#superclass : #FmxSQLStructuralEntity,
	#traits : 'FamixTNamespace',
	#classTraits : 'FamixTNamespace classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLNamespace class >> annotation [

	<MSEClass: #Namespace super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]
