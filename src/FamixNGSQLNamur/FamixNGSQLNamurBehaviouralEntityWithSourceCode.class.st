Class {
	#name : #FamixNGSQLNamurBehaviouralEntityWithSourceCode,
	#superclass : #FamixNGSQLNamurBehaviouralEntity,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurBehaviouralEntityWithSourceCode class >> annotation [

	<MSEClass: #BehaviouralEntityWithSourceCode super: #FamixNGSQLNamurBehaviouralEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurBehaviouralEntityWithSourceCode class >> statefulTraits [

	<statefulTraits>
	^ {}
]
