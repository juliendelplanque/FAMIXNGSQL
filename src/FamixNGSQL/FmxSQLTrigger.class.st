"
I am a trigger. A trigger allows to define actions to performs when a specific event occurs on a table. Because a trigger can not exist without the table to which it listens to events, a trigger is contained in a table.
"
Class {
	#name : #FmxSQLTrigger,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTNamespaceEntity + FmxSQLBehaviouralEntity',
	#classTraits : 'FamixTNamespaceEntity classTrait + FmxSQLBehaviouralEntity classTrait',
	#instVars : [
		'#firingAction => FMProperty',
		'#when => FMProperty',
		'#storedProcedure => FMOne type: #FmxSQLTriggerStoredProcedure opposite: #triggers',
		'#table => FMOne type: #FmxSQLTable opposite: #triggers'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLTrigger class >> annotation [

	<MSEClass: #Trigger super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLTrigger class >> requirements [

	<generated>
	^ { FmxSQLTable }
]

{ #category : #accessing }
FmxSQLTrigger >> allDependencies [
	^ { self storedProcedure }
]

{ #category : #accessing }
FmxSQLTrigger >> allDepending [
	^ { }
]

{ #category : #accessing }
FmxSQLTrigger >> belongsTo [

	<generated>
	^ self table

]

{ #category : #accessing }
FmxSQLTrigger >> belongsTo: anObject [

	<generated>
	self table: anObject

]

{ #category : #accessing }
FmxSQLTrigger >> firingAction [

	<MSEProperty: #firingAction type: #String>
	<generated>
	^ firingAction
]

{ #category : #accessing }
FmxSQLTrigger >> firingAction: anObject [

	<generated>
	firingAction := anObject

]

{ #category : #accessing }
FmxSQLTrigger >> storedProcedure [
	"Relation named: #storedProcedure type: #FmxSQLTriggerStoredProcedure opposite: #triggers"

	<generated>
	^ storedProcedure
]

{ #category : #accessing }
FmxSQLTrigger >> storedProcedure: anObject [

	<generated>
	storedProcedure := anObject

]

{ #category : #accessing }
FmxSQLTrigger >> table [
	"Relation named: #table type: #FmxSQLTable opposite: #triggers"

	<generated>
	<container>
	^ table
]

{ #category : #accessing }
FmxSQLTrigger >> table: anObject [

	<generated>
	table := anObject

]

{ #category : #navigation }
FmxSQLTrigger >> tableGroup [
	<generated>
	<navigation: 'Table'>
	^ MooseGroup with: self table
]

{ #category : #accessing }
FmxSQLTrigger >> when [

	<MSEProperty: #when type: #String>
	<generated>
	^ when
]

{ #category : #accessing }
FmxSQLTrigger >> when: anObject [

	<generated>
	when := anObject

]
