Class {
	#name : #FamixNGSQLNamurColumnAccess,
	#superclass : #FamixNGSQLNamurCodeFragment,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurColumnAccess class >> annotation [

	<MSEClass: #ColumnAccess super: #FamixNGSQLNamurCodeFragment>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurColumnAccess class >> statefulTraits [

	<statefulTraits>
	^ {FamixNGSQLNamurTColumnAccess}
]
