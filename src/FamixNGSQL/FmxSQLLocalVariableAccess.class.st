"
I am an access to a local variable in a procedure.
"
Class {
	#name : #FmxSQLLocalVariableAccess,
	#superclass : #FmxSQLReference,
	#traits : 'FamixTAccess + FmxSQLTWithQualifiedReference',
	#classTraits : 'FamixTAccess classTrait + FmxSQLTWithQualifiedReference classTrait',
	#instVars : [
		'#localVariable => FMOne type: #FmxSQLLocalVariable opposite: #accesses'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLLocalVariableAccess class >> annotation [

	<MSEClass: #LocalVariableAccess super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLLocalVariableAccess >> isLocalVariableAccess [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLLocalVariableAccess >> localVariable [
	"Relation named: #localVariable type: #FmxSQLLocalVariable opposite: #accesses"

	<generated>
	<target>
	^ localVariable
]

{ #category : #accessing }
FmxSQLLocalVariableAccess >> localVariable: anObject [

	<generated>
	localVariable := anObject

]
