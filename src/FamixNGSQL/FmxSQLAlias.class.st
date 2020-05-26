"
I am an Alias
"
Class {
	#name : #FmxSQLAlias,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTAccessible + FmxSQLTWithDerivedTableReference',
	#classTraits : 'FamixTAccessible classTrait + FmxSQLTWithDerivedTableReference classTrait',
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FmxSQLTWithAlias opposite: #aliases'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLAlias class >> annotation [

	<MSEClass: #Alias super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLAlias class >> requirements [

	<generated>
	^ { FmxSQLClause. FmxSQLStoredProcedure }
]

{ #category : #testing }
FmxSQLAlias >> isAlias [

	<generated>
	^ true
]

{ #category : #testing }
FmxSQLAlias >> isAnyBelongerSourced [
	^ self parentBehaviouralEntity isAnyBelongerSourced
]

{ #category : #accessing }
FmxSQLAlias >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FmxSQLTWithAlias opposite: #aliases"

	<generated>
	<container>
	^ parentBehaviouralEntity
]

{ #category : #accessing }
FmxSQLAlias >> parentBehaviouralEntity: anObject [

	<generated>
	parentBehaviouralEntity := anObject

]

{ #category : #navigation }
FmxSQLAlias >> parentBehaviouralEntityGroup [
	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseGroup with: self parentBehaviouralEntity
]

{ #category : #accessing }
FmxSQLAlias >> sourcedBelonger [
	^ self parentBehaviouralEntity sourcedBelonger
]
