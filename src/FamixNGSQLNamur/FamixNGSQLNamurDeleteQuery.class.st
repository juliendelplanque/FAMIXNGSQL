Class {
	#name : #FamixNGSQLNamurDeleteQuery,
	#superclass : #FamixNGSQLNamurCRUDQuery,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurDeleteQuery class >> annotation [

	<MSEClass: #DeleteQuery super: #FamixNGSQLNamurCRUDQuery>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurDeleteQuery class >> statefulTraits [

	<statefulTraits>
	^ {}
]
