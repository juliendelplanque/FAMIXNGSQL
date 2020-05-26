Class {
	#name : #FmxSQLNoSourceAnchor,
	#superclass : #Error,
	#instVars : [
		'entityWithoutSourceAnchor'
	],
	#category : #FamixNGSQL
}

{ #category : #'instance creation' }
FmxSQLNoSourceAnchor class >> signalForEntityWithoutSourceAnchor: entityWithoutSourceAnchor [
	^ self new
		entityWithoutSourceAnchor: entityWithoutSourceAnchor;
		signal
]

{ #category : #accessing }
FmxSQLNoSourceAnchor >> entityWithoutSourceAnchor [
	^ entityWithoutSourceAnchor
]

{ #category : #accessing }
FmxSQLNoSourceAnchor >> entityWithoutSourceAnchor: anObject [
	entityWithoutSourceAnchor := anObject
]
