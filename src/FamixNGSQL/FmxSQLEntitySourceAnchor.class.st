"
I am a source anchor which anchor source code held by an entity with immediate source.
"
Class {
	#name : #FmxSQLEntitySourceAnchor,
	#superclass : #FmxSQLEntity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#instVars : [
		'#start => FMProperty',
		'#end => FMProperty',
		'#entity => FMOne type: #FmxSQLTWithEntitySourceAnchor opposite: #anchorsOnIntervalsOfCode'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLEntitySourceAnchor class >> annotation [

	<MSEClass: #EntitySourceAnchor super: #FmxSQLEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLEntitySourceAnchor >> end [

	<MSEProperty: #end type: #Number>
	<generated>
	^ end
]

{ #category : #accessing }
FmxSQLEntitySourceAnchor >> end: anObject [

	<generated>
	end := anObject

]

{ #category : #accessing }
FmxSQLEntitySourceAnchor >> entity [
	"Relation named: #entity type: #FmxSQLTWithEntitySourceAnchor opposite: #anchorsOnIntervalsOfCode"

	<generated>
	^ entity
]

{ #category : #accessing }
FmxSQLEntitySourceAnchor >> entity: anObject [

	<generated>
	entity := anObject

]

{ #category : #accessing }
FmxSQLEntitySourceAnchor >> interval [
	^ self start to: self end
]

{ #category : #testing }
FmxSQLEntitySourceAnchor >> isEntitySourceAnchor [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLEntitySourceAnchor >> sourceAnchor [
	^ self
]

{ #category : #accessing }
FmxSQLEntitySourceAnchor >> sourceAnchorOrReferenceGroupSourceAnchor [
	^ self
]

{ #category : #accessing }
FmxSQLEntitySourceAnchor >> start [

	<MSEProperty: #start type: #Number>
	<generated>
	^ start
]

{ #category : #accessing }
FmxSQLEntitySourceAnchor >> start: anObject [

	<generated>
	start := anObject

]
