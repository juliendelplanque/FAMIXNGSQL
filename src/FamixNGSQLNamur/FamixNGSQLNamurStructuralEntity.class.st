Class {
	#name : #FamixNGSQLNamurStructuralEntity,
	#superclass : #FamixNGSQLNamurNamedEntity,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurStructuralEntity class >> annotation [

	<MSEClass: #StructuralEntity super: #FamixNGSQLNamurNamedEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurStructuralEntity class >> statefulTraits [

	<statefulTraits>
	^ {}
]
