Class {
	#name : #FamixNGSQLNamurNamedEntity,
	#superclass : #FamixNGSQLNamurEntity,
	#instVars : [
		'name'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #FamixNGSQLNamurEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurNamedEntity class >> statefulTraits [

	<statefulTraits>
	^ {}
]

{ #category : #accessing }
FamixNGSQLNamurNamedEntity >> name [

	<MSEProperty: #name type: #Integer>
	^ name
]

{ #category : #accessing }
FamixNGSQLNamurNamedEntity >> name: anObject [

	name := anObject

]
