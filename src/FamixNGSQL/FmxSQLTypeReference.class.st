"
I am reference to a type of the model.
"
Class {
	#name : #FmxSQLTypeReference,
	#superclass : #FmxSQLReference,
	#instVars : [
		'#type => FMOne type: #FmxSQLType opposite: #references'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLTypeReference class >> annotation [

	<MSEClass: #TypeReference super: #FmxSQLReference>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTypeReference >> type [
	"Relation named: #type type: #FmxSQLType opposite: #references"

	<generated>
	<target>
	^ type
]

{ #category : #accessing }
FmxSQLTypeReference >> type: anObject [

	<generated>
	type := anObject

]
