"
I am an abstract object that represent a reference made to another entity in the source code a behavioural entity.
"
Class {
	#name : #FmxSQLReference,
	#superclass : #FmxSQLAssociation,
	#traits : 'FmxSQLTArgument',
	#classTraits : 'FmxSQLTArgument classTrait',
	#instVars : [
		'#belongsToGroup => FMOne type: #FmxSQLReferencesGroup opposite: #references',
		'#storedProcedureContainer => FMOne type: #FmxSQLStoredProcedureCall opposite: #arguments'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLReference class >> annotation [

	<MSEClass: #Reference super: #FmxSQLAssociation>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLReference class >> requirements [

	<generated>
	^ { FmxSQLReferencesGroup. FmxSQLStoredProcedureCall }
]

{ #category : #accessing }
FmxSQLReference >> belongsTo [

	<generated>
	^ self belongsToGroup

]

{ #category : #accessing }
FmxSQLReference >> belongsTo: anObject [

	<generated>
	self belongsToGroup: anObject

]

{ #category : #accessing }
FmxSQLReference >> belongsToGroup [
	"Relation named: #belongsToGroup type: #FmxSQLReferencesGroup opposite: #references"

	<generated>
	<container>
	^ belongsToGroup
]

{ #category : #accessing }
FmxSQLReference >> belongsToGroup: anObject [

	<generated>
	belongsToGroup := anObject

]

{ #category : #navigation }
FmxSQLReference >> belongsToGroupGroup [
	<generated>
	<navigation: 'BelongsToGroup'>
	^ MooseGroup with: self belongsToGroup
]

{ #category : #testing }
FmxSQLReference >> isInReferencesGroup [
	^ self belongsToGroup isNotNil
]

{ #category : #testing }
FmxSQLReference >> isReference [
	^ true
]

{ #category : #testing }
FmxSQLReference >> isWildCardReference [
	^ false
]

{ #category : #accessing }
FmxSQLReference >> sourceAnchor [
	^ super sourceAnchor
		ifNil: [ 
			self belongsToGroup
				ifNil: [ FmxSQLNoSourceAnchor signalForEntityWithoutSourceAnchor: self ]
				ifNotNil: #sourceAnchor ]
]

{ #category : #accessing }
FmxSQLReference >> sourceAnchorOrReferenceGroupSourceAnchor [
	^ self sourceAnchor
		ifNil: [ 
			self belongsToGroup
				ifNotNil: #sourceAnchor
				ifNil: [ nil ] ]
]

{ #category : #accessing }
FmxSQLReference >> start [
	"Returns the first position of myself in the source code.
	 I simply return the result of #start method sent to my #sourceAnchor."
	^ self sourceAnchor start
]

{ #category : #accessing }
FmxSQLReference >> stop [
	"Returns the last position of myself in the source code.
	 I return the result of #stop method sent to my #sourceAnchor except for the stored procedure call (see method)."
	^ self sourceAnchor end
]

{ #category : #accessing }
FmxSQLReference >> storedProcedureContainer [
	"Relation named: #storedProcedureContainer type: #FmxSQLStoredProcedureCall opposite: #arguments"

	<generated>
	<container>
	^ storedProcedureContainer
]

{ #category : #accessing }
FmxSQLReference >> storedProcedureContainer: anObject [

	<generated>
	storedProcedureContainer := anObject

]

{ #category : #navigation }
FmxSQLReference >> storedProcedureContainerGroup [
	<generated>
	<navigation: 'StoredProcedureContainer'>
	^ MooseGroup with: self storedProcedureContainer
]
