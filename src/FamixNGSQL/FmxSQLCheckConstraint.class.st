"
I represent a CHECK constraint as defined in SQL standard.
"
Class {
	#name : #FmxSQLCheckConstraint,
	#superclass : #FmxSQLConstraint,
	#traits : 'FamixTWithImmediateSource',
	#classTraits : 'FamixTWithImmediateSource classTrait',
	#instVars : [
		'#storedProceduresCalled => FMMany type: #FmxSQLStoredProcedure opposite: #checkConstraintsCalling'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLCheckConstraint class >> annotation [

	<MSEClass: #CheckConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLCheckConstraint >> isCheckConstraint [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLCheckConstraint >> storedProceduresCalled [
	"Relation named: #storedProceduresCalled type: #FmxSQLStoredProcedure opposite: #checkConstraintsCalling"

	<generated>
	^ storedProceduresCalled
]

{ #category : #accessing }
FmxSQLCheckConstraint >> storedProceduresCalled: anObject [

	<generated>
	storedProceduresCalled value: anObject

]
