"
I am a parameter of a stored procedure. I have a type.
"
Class {
	#name : #FmxSQLParameter,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTAccessible + FamixTParameter',
	#classTraits : 'FamixTAccessible classTrait + FamixTParameter classTrait',
	#instVars : [
		'#type => FMOne type: #FmxSQLAbstractType opposite: #parameters'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLParameter class >> annotation [

	<MSEClass: #Parameter super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLParameter class >> requirements [

	<generated>
	^ { FmxSQLCursor. FmxSQLStoredProcedure }
]

{ #category : #accessing }
FmxSQLParameter >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FmxSQLParameter >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #accessing }
FmxSQLParameter >> maximalImpactSet [
	^ self query: #in with: FmxSQLParameterAccess 
]

{ #category : #accessing }
FmxSQLParameter >> storedProcedure [
	^ self parentBehaviouralEntity
]

{ #category : #accessing }
FmxSQLParameter >> storedProcedure: anObject [
	self parentBehaviouralEntity: anObject
]

{ #category : #accessing }
FmxSQLParameter >> type [
	"Relation named: #type type: #FmxSQLAbstractType opposite: #parameters"

	<generated>
	^ type
]

{ #category : #accessing }
FmxSQLParameter >> type: anObject [

	<generated>
	type := anObject

]
