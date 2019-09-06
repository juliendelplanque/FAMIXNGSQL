"
I represent a Type in the database. I can be used for a column, a local variable, a parameter, etc...
"
Class {
	#name : #FmxSQLType,
	#superclass : #FmxSQLStructuralEntity,
	#traits : 'FmxSQLAbstractType',
	#classTraits : 'FmxSQLAbstractType classTrait',
	#instVars : [
		'#columns => FMMany type: #FmxSQLColumn opposite: #type',
		'#references => FMMany type: #FmxSQLTypeReference opposite: #type'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLType class >> annotation [

	<MSEClass: #Type super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLType >> columns [
	"Relation named: #columns type: #FmxSQLColumn opposite: #type"

	<generated>
	^ columns
]

{ #category : #accessing }
FmxSQLType >> columns: anObject [

	<generated>
	columns value: anObject

]

{ #category : #accessing }
FmxSQLType >> references [
	"Relation named: #references type: #FmxSQLTypeReference opposite: #type"

	<generated>
	^ references
]

{ #category : #accessing }
FmxSQLType >> references: anObject [

	<generated>
	references value: anObject

]
