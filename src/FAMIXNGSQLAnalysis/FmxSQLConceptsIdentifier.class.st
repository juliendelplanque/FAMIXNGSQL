Class {
	#name : #FmxSQLConceptsIdentifier,
	#superclass : #Object,
	#instVars : [
		'experiment',
		'nonClassifiedEntities'
	],
	#category : #'FAMIXNGSQLAnalysis-ConceptsIdentification'
}

{ #category : #accessing }
FmxSQLConceptsIdentifier >> classifiedEntities [
	^ self model entities select: [ :e | e hasConcept ].
]

{ #category : #classify }
FmxSQLConceptsIdentifier >> classify [
	self model entities reject: [ :e | e class = FmxSQLTable ] thenDo: #resetConcept.
	nonClassifiedEntities := (self model entities select: [ :e | e isStub not and: [ (self scope includes: e class) and: [ e parentNamespace name ~= 'pg_catalog' ] ] ]) asSet.
	nonClassifiedEntities := nonClassifiedEntities reject: #hasConcept.
	
	self
		floodClassify;
		classifyDependingOnCoreConceptOnly;
		classifyTriggers
]

{ #category : #classify }
FmxSQLConceptsIdentifier >> classifyDependingOnCoreConceptOnly [
	nonClassifiedEntities
		select: [ :e | 
			([ e conceptDependencies ] on: Error do: [ #() ]) size = 2 and: [ e conceptDependencies includes: 0 ] ]
		thenDo: [ :e | 
			e concept: (e conceptDependencies \ {0}) anyOne ].
	nonClassifiedEntities := nonClassifiedEntities reject: #hasConcept.
]

{ #category : #classify }
FmxSQLConceptsIdentifier >> classifyTriggers [
	"Concept of a trigger is the concept of the stored procedure it uses."
	self model entities
		select: [ :e | 
			e isStub not and: [ e class = FmxSQLTrigger and: [ e storedProcedure hasConcept ] ] ]
		thenDo: [ :trigger |
			trigger concept: trigger storedProcedure concept ].
]

{ #category : #accessing }
FmxSQLConceptsIdentifier >> entitiesToBeManuallyClassified [
	^ self nonClassifiedEntities
		reject: [ :e | { FmxSQLTrigger } includes: e class ]
]

{ #category : #accessing }
FmxSQLConceptsIdentifier >> experiment [
	^ experiment
]

{ #category : #accessing }
FmxSQLConceptsIdentifier >> experiment: anObject [
	experiment := anObject
]

{ #category : #export }
FmxSQLConceptsIdentifier >> exportClassifiedEntitiesAsArray [
	^ (self classifiedEntities collect: [ :e |
		{
			e className allButFirst: 'FmxSQL' size.
			e name.
			e concept
		} ]) sorted: #first ascending, #second ascending.
]

{ #category : #csv }
FmxSQLConceptsIdentifier >> exportClassifiedEntitiesAsCSVIn: fileReference [
	^ fileReference writeStreamDo: [ :stream |
		(NeoCSVWriter on: stream)
			nextPut: #('Type' 'Name' 'Feature group');
			nextPutAll: self exportClassifiedEntitiesAsArray ]
]

{ #category : #export }
FmxSQLConceptsIdentifier >> exportEntitiesToBeManuallyClassifiedAsArray [
	^ (self entitiesToBeManuallyClassified
		collect: [ :e |
			{
				e className allButFirst: 'FmxSQL' size.
				e name.
				(e dependenciesForConcepts collect: #name as: Array) joinUsing: ', '.
				(e dependenciesForConcepts collect: [ :d |
					d hasConcept
						ifTrue: [ d concept asString ]
						ifFalse: [ '?' ] ]) asArray joinUsing: ', '
			} ]) sorted: #first ascending, #second ascending.
]

{ #category : #csv }
FmxSQLConceptsIdentifier >> exportEntitiesToBeManuallyClassifiedAsCSVIn: fileReference [
	^ fileReference writeStreamDo: [ :stream |
		(NeoCSVWriter on: stream)
			nextPut: #('Type' 'Name' 'Entities it depends on' 'Feature groups of entitites it depends on');
			nextPutAll: self exportEntitiesToBeManuallyClassifiedAsArray ]
]

{ #category : #export }
FmxSQLConceptsIdentifier >> exportTriggerToBeClassifiedAfterAsArray [
	^ (self nonClassifiedEntities
		select: [ :e | { FmxSQLTrigger } includes: e class ]
		thenCollect: [ :e |
		{
			e className allButFirst: 'FmxSQL' size.
			e name.
			e storedProcedure name
		} ]) sorted: #first ascending, #second ascending.
]

{ #category : #csv }
FmxSQLConceptsIdentifier >> exportTriggerToBeClassifiedAfterAsCSVIn: fileReference [
	^ fileReference writeStreamDo: [ :stream |
		(NeoCSVWriter on: stream)
			nextPut: #('Type' 'Name' 'Stored Procedure called');
			nextPutAll: self exportTriggerToBeClassifiedAfterAsArray ]
]

{ #category : #classify }
FmxSQLConceptsIdentifier >> floodClassify [
	|previousSize|
	[ 
		previousSize := nonClassifiedEntities size.
		nonClassifiedEntities do: [ :e |
			|dependencies|
			dependencies := e dependenciesForConcepts.
			(dependencies allSatisfy: #hasConcept)
				ifTrue: [ 
					|concepts|
					concepts := (dependencies collect: #concept) asSet.
					"If all entities it depends on have the same concept, the entity has this concept."
					concepts size = 1 
						ifTrue: [ e concept: concepts anyOne ] ] ].
		nonClassifiedEntities := nonClassifiedEntities reject: #hasConcept.
	] doWhileTrue: [ nonClassifiedEntities size < previousSize ].
]

{ #category : #accessing }
FmxSQLConceptsIdentifier >> model [
	^ self experiment model
]

{ #category : #accessing }
FmxSQLConceptsIdentifier >> nonClassifiedEntities [
	^ nonClassifiedEntities
]

{ #category : #accessing }
FmxSQLConceptsIdentifier >> scope [
	^ { FmxSQLTable. FmxSQLView. FmxSQLStoredProcedure. FmxSQLTriggerStoredProcedure. FmxSQLTrigger }
]
