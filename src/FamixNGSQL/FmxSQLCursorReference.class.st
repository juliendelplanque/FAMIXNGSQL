"
I am a reference to a cursor
"
Class {
	#name : #FmxSQLCursorReference,
	#superclass : #FmxSQLReference,
	#traits : 'FmxSQLTWithQualifiedReference',
	#classTraits : 'FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#cursor => FMOne type: #FmxSQLCursor opposite: #references',
		'#source => FMOne type: #FmxSQLTWithCursorReference opposite: #outgoingCursorReferences'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLCursorReference class >> annotation [

	<MSEClass: #CursorReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLCursorReference >> cursor [
	"Relation named: #cursor type: #FmxSQLCursor opposite: #references"

	<generated>
	<target>
	^ cursor
]

{ #category : #accessing }
FmxSQLCursorReference >> cursor: anObject [

	<generated>
	cursor := anObject

]

{ #category : #accessing }
FmxSQLCursorReference >> source [
	"Relation named: #source type: #FmxSQLTWithCursorReference opposite: #outgoingCursorReferences"

	<generated>
	<source>
	^ source
]

{ #category : #accessing }
FmxSQLCursorReference >> source: anObject [

	<generated>
	source := anObject

]
