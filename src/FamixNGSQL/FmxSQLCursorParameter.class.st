"
I am a cursor parameter
"
Class {
	#name : #FmxSQLCursorParameter,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTAccessible + FamixTParameter',
	#classTraits : 'FamixTAccessible classTrait + FamixTParameter classTrait',
	#instVars : [
		'#type => FMOne type: #FmxSQLAbstractType opposite: #cursorParameters'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLCursorParameter class >> annotation [

	<MSEClass: #CursorParameter super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLCursorParameter class >> requirements [

	<generated>
	^ { FmxSQLCursor. FmxSQLStoredProcedure }
]

{ #category : #accessing }
FmxSQLCursorParameter >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FmxSQLCursorParameter >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #accessing }
FmxSQLCursorParameter >> cursor [
	^ self parentBehaviouralEntity
]

{ #category : #accessing }
FmxSQLCursorParameter >> cursor: anObject [
	self parentBehaviouralEntity: anObject
]

{ #category : #accessing }
FmxSQLCursorParameter >> type [
	"Relation named: #type type: #FmxSQLAbstractType opposite: #cursorParameters"

	<generated>
	^ type
]

{ #category : #accessing }
FmxSQLCursorParameter >> type: anObject [

	<generated>
	type := anObject

]
