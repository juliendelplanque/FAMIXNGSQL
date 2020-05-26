Class {
	#name : #FamixNGSQLNamurBehaviouralEntity,
	#superclass : #FamixNGSQLNamurNamedEntity,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurBehaviouralEntity class >> annotation [

	<MSEClass: #BehaviouralEntity super: #FamixNGSQLNamurNamedEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurBehaviouralEntity class >> statefulTraits [

	<statefulTraits>
	^ {}
]
