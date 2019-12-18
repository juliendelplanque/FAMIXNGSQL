"
I model a reference made to a namespace from source code.
"
Class {
	#name : #FmxSQLNamespaceReference,
	#superclass : #FmxSQLReference,
	#traits : 'FmxSQLTWithQualifiedReference',
	#classTraits : 'FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#namespace => FMOne type: #FmxSQLNamespace opposite: #references',
		'#source => FMOne type: #FmxSQLTWithNamespaceReference opposite: #outgoingNamespaceReference'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLNamespaceReference class >> annotation [

	<MSEClass: #NamespaceReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLNamespaceReference >> namespace [
	"Relation named: #namespace type: #FmxSQLNamespace opposite: #references"

	<generated>
	<target>
	^ namespace
]

{ #category : #accessing }
FmxSQLNamespaceReference >> namespace: anObject [

	<generated>
	namespace := anObject

]

{ #category : #accessing }
FmxSQLNamespaceReference >> source [
	"Relation named: #source type: #FmxSQLTWithNamespaceReference opposite: #outgoingNamespaceReference"

	<generated>
	^ source
]

{ #category : #accessing }
FmxSQLNamespaceReference >> source: anObject [

	<generated>
	source := anObject

]
