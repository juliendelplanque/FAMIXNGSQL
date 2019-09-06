Class {
	#name : #FamixNGSQLNamurView,
	#superclass : #FamixNGSQLNamurBehaviouralEntityWithSourceCode,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurView class >> annotation [

	<MSEClass: #View super: #FamixNGSQLNamurBehaviouralEntityWithSourceCode>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurView class >> statefulTraits [

	<statefulTraits>
	^ {FamixNGSQLNamurTView}
]
