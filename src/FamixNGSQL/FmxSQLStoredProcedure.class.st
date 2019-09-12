"
I am a stored procedure. That is to say, a function that is defined inside the database.
"
Class {
	#name : #FmxSQLStoredProcedure,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTInvocable + FamixTNamespaceEntity + FamixTWithAccesses + FamixTWithImmediateSource + FamixTWithInvocations + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithReferences + FmxSQLBehaviouralEntity + FmxSQLTQueryContainer + FmxSQLTWithAlias + FmxSQLTWithColumnReference + FmxSQLTWithCursor + FmxSQLTWithCursorReference + FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FamixTInvocable classTrait + FamixTNamespaceEntity classTrait + FamixTWithAccesses classTrait + FamixTWithImmediateSource classTrait + FamixTWithInvocations classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithReferences classTrait + FmxSQLBehaviouralEntity classTrait + FmxSQLTQueryContainer classTrait + FmxSQLTWithAlias classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithCursor classTrait + FmxSQLTWithCursorReference classTrait + FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#instVars : [
		'#checkConstraintsCalling => FMMany type: #FmxSQLCheckConstraint opposite: #storedProceduresCalled',
		'#returnType => FMOne type: #FmxSQLAbstractType opposite: #storedProceduresReturning'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLStoredProcedure class >> annotation [

	<MSEClass: #StoredProcedure super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLStoredProcedure >> allDependencies [
	^ self viewsDependencies , self storedProceduresDependencies
]

{ #category : #accessing }
FmxSQLStoredProcedure >> allDepending [
	^ self viewsDepending , self storedProceduresDepending
]

{ #category : #accessing }
FmxSQLStoredProcedure >> allStoredProceduresDependencies [
	"Returns the stored procedures that I depend on directly and indirectly."
	^ (self anyTreeIterator: #storedProceduresDependencies) allButFirst
]

{ #category : #accessing }
FmxSQLStoredProcedure >> allStoredProceduresDepending [
	"Returns the stored procedures that I depend on directly and indirectly."
	^ (self anyTreeIterator: #storedProceduresDepending) allButFirst
]

{ #category : #accessing }
FmxSQLStoredProcedure >> allViewsDependencies [
	"Returns the views that I depend on directly and indirectly."
	^ (self anyTreeIterator: #viewsDependencies) allButFirst
]

{ #category : #accessing }
FmxSQLStoredProcedure >> allViewsDepending [
	"Returns the views that I depend on directly and indirectly."
	^ (self anyTreeIterator: #viewsDepending) allButFirst
]

{ #category : #accessing }
FmxSQLStoredProcedure >> checkConstraintsCalling [
	"Relation named: #checkConstraintsCalling type: #FmxSQLCheckConstraint opposite: #storedProceduresCalled"

	<generated>
	^ checkConstraintsCalling
]

{ #category : #accessing }
FmxSQLStoredProcedure >> checkConstraintsCalling: anObject [

	<generated>
	checkConstraintsCalling value: anObject

]

{ #category : #testing }
FmxSQLStoredProcedure >> isAnyBelongerSourced [
	^ true
]

{ #category : #testing }
FmxSQLStoredProcedure >> isStoredProcedure [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLStoredProcedure >> returnType [
	"Relation named: #returnType type: #FmxSQLAbstractType opposite: #storedProceduresReturning"

	<generated>
	^ returnType
]

{ #category : #accessing }
FmxSQLStoredProcedure >> returnType: anObject [

	<generated>
	returnType := anObject

]

{ #category : #accessing }
FmxSQLStoredProcedure >> sourceCodeAsText [
	^ PostgreSQLHighlighter highlightSelectQuery: self source
]

{ #category : #accessing }
FmxSQLStoredProcedure >> sourcedBelonger [
	^ self
]

{ #category : #accessing }
FmxSQLStoredProcedure >> storedProceduresDependencies [
	"Returns the stored procedures that I depend on directly (I call them directly)."
	^ ((self queryOutgoing: FmxSQLStoredProcedureCall) collect: [ :ref | ref to ]) asSet
]

{ #category : #accessing }
FmxSQLStoredProcedure >> storedProceduresDepending [
	"Returns the views that depends on myself directly (reference myself directly)."
	^ ((self queryLocalIncoming: FmxSQLStoredProcedureCall) collect: [ :ref | ref from sourcedBelonger ] thenSelect: [ :sourcedBelonger | sourcedBelonger isNotNil and: [ sourcedBelonger isStoredProcedure ] ]) asSet
]

{ #category : #accessing }
FmxSQLStoredProcedure >> viewsDependencies [
	"Returns the views that I depend on directly (I reference them directly)."
	^ ((self queryOutgoing: FmxSQLViewReference) collect: [ :ref | ref to ]) asSet
]

{ #category : #accessing }
FmxSQLStoredProcedure >> viewsDepending [
	"Returns the views that depends on myself directly (reference myself directly)."
	^ ((self queryLocalIncoming: FmxSQLStoredProcedureCall) collect: [ :ref | ref from sourcedBelonger ] thenSelect: [ :sourcedBelonger | sourcedBelonger isNotNil and: [ sourcedBelonger isView ] ]) asSet
]
