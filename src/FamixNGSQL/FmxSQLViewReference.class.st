"
I am a reference to a view.
"
Class {
	#name : #FmxSQLViewReference,
	#superclass : #FmxSQLReference,
	#traits : 'FmxSQLTWithQualifiedReference',
	#classTraits : 'FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#source => FMOne type: #FmxSQLTWithViewReference opposite: #outgoingViewReferences',
		'#view => FMOne type: #FmxSQLView opposite: #references'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLViewReference class >> annotation [

	<MSEClass: #ViewReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLViewReference >> source [
	"Relation named: #source type: #FmxSQLTWithViewReference opposite: #outgoingViewReferences"

	<generated>
	<source>
	^ source
]

{ #category : #accessing }
FmxSQLViewReference >> source: anObject [

	<generated>
	source := anObject

]

{ #category : #accessing }
FmxSQLViewReference >> view [
	"Relation named: #view type: #FmxSQLView opposite: #references"

	<generated>
	<target>
	^ view
]

{ #category : #accessing }
FmxSQLViewReference >> view: anObject [

	<generated>
	view := anObject

]
