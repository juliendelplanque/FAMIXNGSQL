Class {
	#name : #FamixNGSQLNamurConstraint,
	#superclass : #FamixNGSQLNamurBehaviouralEntityWithSourceCode,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurConstraint class >> annotation [

	<MSEClass: #Constraint super: #FamixNGSQLNamurBehaviouralEntityWithSourceCode>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurConstraint class >> statefulTraits [

	<statefulTraits>
	^ {FamixNGSQLNamurTConstraint}
]
