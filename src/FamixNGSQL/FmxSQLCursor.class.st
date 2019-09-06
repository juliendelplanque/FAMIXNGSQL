"
I am a cursor, a local iterator that can have parameters
"
Class {
	#name : #FmxSQLCursor,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTWithParameters + FmxSQLBehaviouralEntity + FmxSQLTQueryContainer',
	#classTraits : 'FamixTWithParameters classTrait + FmxSQLBehaviouralEntity classTrait + FmxSQLTQueryContainer classTrait',
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FmxSQLTWithCursor opposite: #cursors',
		'#references => FMMany type: #FmxSQLCursorReference opposite: #cursor'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLCursor class >> annotation [

	<MSEClass: #Cursor super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLCursor class >> requirements [

	<generated>
	^ { FmxSQLStoredProcedure }
]

{ #category : #accessing }
FmxSQLCursor >> belongsTo [

	<generated>
	^ self parentBehaviouralEntity

]

{ #category : #accessing }
FmxSQLCursor >> belongsTo: anObject [

	<generated>
	self parentBehaviouralEntity: anObject

]

{ #category : #accessing }
FmxSQLCursor >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FmxSQLTWithCursor opposite: #cursors"

	<generated>
	<container>
	^ parentBehaviouralEntity
]

{ #category : #accessing }
FmxSQLCursor >> parentBehaviouralEntity: anObject [

	<generated>
	parentBehaviouralEntity := anObject

]

{ #category : #navigation }
FmxSQLCursor >> parentBehaviouralEntityGroup [
	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseGroup with: self parentBehaviouralEntity
]

{ #category : #accessing }
FmxSQLCursor >> references [
	"Relation named: #references type: #FmxSQLCursorReference opposite: #cursor"

	<generated>
	^ references
]

{ #category : #accessing }
FmxSQLCursor >> references: anObject [

	<generated>
	references value: anObject

]
