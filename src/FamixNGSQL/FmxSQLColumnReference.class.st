"
I am reference to a column in a table of the model.
"
Class {
	#name : #FmxSQLColumnReference,
	#superclass : #FmxSQLReference,
	#traits : 'FmxSQLTWithQualifiedReference',
	#classTraits : 'FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#column => FMOne type: #FmxSQLColumn opposite: #references',
		'#foreignKeyConstraintSource => FMOne type: #FmxSQLForeignKeyConstraint opposite: #outgoingForeignKeyColumnReferences',
		'#isCertain => FMProperty',
		'#isWildCardReference => FMProperty',
		'#source => FMOne type: #FmxSQLTWithColumnReference opposite: #outgoingColumnReferences',
		'#triggerStoredProceduresReferencing => FMOne type: #FmxSQLTriggerStoredProcedure opposite: #columnsReferenced'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLColumnReference class >> annotation [

	<MSEClass: #ColumnReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLColumnReference class >> requirements [

	<generated>
	^ { FmxSQLTriggerStoredProcedure }
]

{ #category : #accessing }
FmxSQLColumnReference >> belongsTo [

	<generated>
	^ self triggerStoredProceduresReferencing

]

{ #category : #accessing }
FmxSQLColumnReference >> belongsTo: anObject [

	<generated>
	self triggerStoredProceduresReferencing: anObject

]

{ #category : #accessing }
FmxSQLColumnReference >> column [
	"Relation named: #column type: #FmxSQLColumn opposite: #references"

	<generated>
	<target>
	^ column
]

{ #category : #accessing }
FmxSQLColumnReference >> column: anObject [

	<generated>
	column := anObject

]

{ #category : #accessing }
FmxSQLColumnReference >> foreignKeyConstraintSource [
	"Relation named: #foreignKeyConstraintSource type: #FmxSQLForeignKeyConstraint opposite: #outgoingForeignKeyColumnReferences"

	<generated>
	<source>
	^ foreignKeyConstraintSource
]

{ #category : #accessing }
FmxSQLColumnReference >> foreignKeyConstraintSource: anObject [

	<generated>
	foreignKeyConstraintSource := anObject

]

{ #category : #accessing }
FmxSQLColumnReference >> isCertain [

	<MSEProperty: #isCertain type: #Boolean>
	<generated>
	^ isCertain
]

{ #category : #accessing }
FmxSQLColumnReference >> isCertain: anObject [

	<generated>
	isCertain := anObject

]

{ #category : #testing }
FmxSQLColumnReference >> isColumnReference [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLColumnReference >> isWildCardReference [

	<MSEProperty: #isWildCardReference type: #Boolean>
	<generated>
	^ isWildCardReference
]

{ #category : #accessing }
FmxSQLColumnReference >> isWildCardReference: anObject [

	<generated>
	isWildCardReference := anObject

]

{ #category : #accessing }
FmxSQLColumnReference >> source [
	"Relation named: #source type: #FmxSQLTWithColumnReference opposite: #outgoingColumnReferences"

	<generated>
	<source>
	^ source
]

{ #category : #accessing }
FmxSQLColumnReference >> source: anObject [

	<generated>
	source := anObject

]

{ #category : #accessing }
FmxSQLColumnReference >> triggerStoredProceduresReferencing [
	"Relation named: #triggerStoredProceduresReferencing type: #FmxSQLTriggerStoredProcedure opposite: #columnsReferenced"

	<generated>
	<container>
	^ triggerStoredProceduresReferencing
]

{ #category : #accessing }
FmxSQLColumnReference >> triggerStoredProceduresReferencing: anObject [

	<generated>
	triggerStoredProceduresReferencing := anObject

]

{ #category : #navigation }
FmxSQLColumnReference >> triggerStoredProceduresReferencingGroup [
	<generated>
	<navigation: 'TriggerStoredProceduresReferencing'>
	^ MooseGroup with: self triggerStoredProceduresReferencing
]
