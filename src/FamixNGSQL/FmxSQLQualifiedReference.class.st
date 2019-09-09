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
	#superclass : #FmxSQLReference,
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLQualifiedReference class >> annotation [

	<MSEClass: #QualifiedReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]
