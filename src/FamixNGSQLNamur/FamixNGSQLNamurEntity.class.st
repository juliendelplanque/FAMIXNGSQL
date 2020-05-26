Class {
	#name : #FamixNGSQLNamurEntity,
	#superclass : #MooseEntity,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurEntity class >> statefulTraits [

	<statefulTraits>
	^ {}
]
