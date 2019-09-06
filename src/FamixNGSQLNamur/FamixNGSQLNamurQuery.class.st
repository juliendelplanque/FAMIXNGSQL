Class {
	#name : #FamixNGSQLNamurQuery,
	#superclass : #FamixNGSQLNamurBehaviouralEntityWithSourceCode,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurQuery class >> annotation [

	<MSEClass: #Query super: #FamixNGSQLNamurBehaviouralEntityWithSourceCode>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurQuery class >> statefulTraits [

	<statefulTraits>
	^ {}
]
