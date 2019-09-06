"
I am a call to a stored procedure of the model.
"
Class {
	#name : #FmxSQLStoredProcedureCall,
	#superclass : #FmxSQLReference,
	#traits : 'FamixTInvocation',
	#classTraits : 'FamixTInvocation classTrait',
	#instVars : [
		'#arguments => FMMany type: #FmxSQLReference opposite: #storedProcedureContainer'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLStoredProcedureCall class >> annotation [

	<MSEClass: #StoredProcedureCall super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLStoredProcedureCall >> addArguments: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : #accessing }
FmxSQLStoredProcedureCall >> arguments [
	"Relation named: #arguments type: #FmxSQLReference opposite: #storedProcedureContainer"

	<generated>
	^ arguments
]

{ #category : #accessing }
FmxSQLStoredProcedureCall >> arguments: anObject [

	<generated>
	arguments value: anObject

]

{ #category : #navigation }
FmxSQLStoredProcedureCall >> argumentsGroup [
	<generated>
	<navigation: 'Arguments'>
	^ MooseGroup withAll: self arguments asSet
]

{ #category : #testing }
FmxSQLStoredProcedureCall >> isStoredProcedureCall [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLStoredProcedureCall >> stop [
	"Returns the last position of the stored procedure name in the source code (without parentheses and args)."
	| sourceCode |
	sourceCode := self source sourcedBelonger source copyFrom: self start to: sourceCode size.
	self flag: #TODO. "This heuristic might be wrong. We need more data in the model..."
	^ self start + sourceCode detectIndex: [ :c | c = $( ]
]
