Class {
	#name : #FamixNGSQLNamurColumn,
	#superclass : #FamixNGSQLNamurStructuralEntity,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurColumn class >> annotation [

	<MSEClass: #Column super: #FamixNGSQLNamurStructuralEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurColumn class >> statefulTraits [

	<statefulTraits>
	^ {FamixNGSQLNamurTColumn}
]
