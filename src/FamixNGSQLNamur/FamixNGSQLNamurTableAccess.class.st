Class {
	#name : #FamixNGSQLNamurTableAccess,
	#superclass : #FamixNGSQLNamurCodeFragment,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTableAccess class >> annotation [

	<MSEClass: #TableAccess super: #FamixNGSQLNamurCodeFragment>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurTableAccess class >> statefulTraits [

	<statefulTraits>
	^ {FamixNGSQLNamurTTableAccess}
]
