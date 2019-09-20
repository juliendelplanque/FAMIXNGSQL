"
I model a qualified reference.

For example, namespace.table.column is modeled as 3 references:
- NamespaceReference
- TableReference
- ColumnReference

together grouped in a QualifiedReference.

One can ask the #qualifiedReference to any reference in the system, it will be set if it has one.
"
Class {
	#name : #FmxSQLQualifiedReference,
	#superclass : #FmxSQLEntity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#instVars : [
		'#references => FMMany type: #FmxSQLTWithQualifiedReference opposite: #qualifiedReference'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLQualifiedReference class >> annotation [

	<MSEClass: #QualifiedReference super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLQualifiedReference >> references [
	"Relation named: #references type: #FmxSQLTWithQualifiedReference opposite: #qualifiedReference"

	<generated>
	^ references
]

{ #category : #accessing }
FmxSQLQualifiedReference >> references: anObject [

	<generated>
	references value: anObject

]
