Class {
	#name : #FamixNGSQLNamurInsertQuery,
	#superclass : #FamixNGSQLNamurCRUDQuery,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurInsertQuery class >> annotation [

	<MSEClass: #InsertQuery super: #FamixNGSQLNamurCRUDQuery>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurInsertQuery class >> statefulTraits [

	<statefulTraits>
	^ {}
]
