"
I am a local variable of a stored procedure. I have a type.
"
Class {
	#name : #FmxSQLLocalVariable,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTAccessible + FamixTLocalVariable',
	#classTraits : 'FamixTAccessible classTrait + FamixTLocalVariable classTrait',
	#instVars : [
		'#type => FMOne type: #FmxSQLAbstractType opposite: #localVariables',
		'#accesses => FMMany type: #FmxSQLLocalVariableAccess opposite: #localVariable'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLLocalVariable class >> annotation [

	<MSEClass: #LocalVariable super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLLocalVariable class >> requirements [

	<generated>
	^ { FmxSQLStoredProcedure }
]

{ #category : #accessing }
FmxSQLLocalVariable >> accesses [
	"Relation named: #accesses type: #FmxSQLLocalVariableAccess opposite: #localVariable"

	<generated>
	^ accesses
]

{ #category : #accessing }
FmxSQLLocalVariable >> accesses: anObject [

	<generated>
	accesses value: anObject

]

{ #category : #accessing }
FmxSQLLocalVariable >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FmxSQLLocalVariable >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #accessing }
FmxSQLLocalVariable >> storedProcedure [
	^ self parentBehaviouralEntity
]

{ #category : #accessing }
FmxSQLLocalVariable >> storedProcedure: anObject [
	self parentBehaviouralEntity: anObject
]

{ #category : #accessing }
FmxSQLLocalVariable >> type [
	"Relation named: #type type: #FmxSQLAbstractType opposite: #localVariables"

	<generated>
	^ type
]

{ #category : #accessing }
FmxSQLLocalVariable >> type: anObject [

	<generated>
	type := anObject

]
