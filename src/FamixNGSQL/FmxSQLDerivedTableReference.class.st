"
I am a reference to a derived table.
"
Class {
	#name : #FmxSQLDerivedTableReference,
	#superclass : #FmxSQLReference,
	#instVars : [
		'#source => FMOne type: #FmxSQLTWithDerivedTableReference opposite: #outgoingDerivedTableReferences',
		'#derivedTable => FMOne type: #FmxSQLDerivedTable opposite: #references'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLDerivedTableReference class >> annotation [

	<MSEClass: #DerivedTableReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLDerivedTableReference >> derivedTable [
	"Relation named: #derivedTable type: #FmxSQLDerivedTable opposite: #references"

	<generated>
	<target>
	^ derivedTable
]

{ #category : #accessing }
FmxSQLDerivedTableReference >> derivedTable: anObject [

	<generated>
	derivedTable := anObject

]

{ #category : #accessing }
FmxSQLDerivedTableReference >> source [
	"Relation named: #source type: #FmxSQLTWithDerivedTableReference opposite: #outgoingDerivedTableReferences"

	<generated>
	<source>
	^ source
]

{ #category : #accessing }
FmxSQLDerivedTableReference >> source: anObject [

	<generated>
	source := anObject

]
