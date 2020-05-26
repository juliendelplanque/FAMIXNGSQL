"
I am local variable of type record. I can contain columns. These columns are set when a SELECT INTO is encountered.
"
Class {
	#name : #FmxSQLRecordLocalVariable,
	#superclass : #FmxSQLLocalVariable,
	#traits : 'FmxSQLColumnsContainer',
	#classTraits : 'FmxSQLColumnsContainer classTrait',
	#instVars : [
		'#queryBoundTo => FMOne type: #FmxSQLSelectQuery opposite: #recordLocalVariables'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLRecordLocalVariable class >> annotation [

	<MSEClass: #RecordLocalVariable super: #FmxSQLLocalVariable>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLRecordLocalVariable >> queryBoundTo [
	"Relation named: #queryBoundTo type: #FmxSQLSelectQuery opposite: #recordLocalVariables"

	<generated>
	^ queryBoundTo
]

{ #category : #accessing }
FmxSQLRecordLocalVariable >> queryBoundTo: anObject [

	<generated>
	queryBoundTo := anObject

]
