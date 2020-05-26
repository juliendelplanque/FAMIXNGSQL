Class {
	#name : #FamixNGSQLNamurUpdateQuery,
	#superclass : #FamixNGSQLNamurCRUDQuery,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurUpdateQuery class >> annotation [

	<MSEClass: #UpdateQuery super: #FamixNGSQLNamurCRUDQuery>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurUpdateQuery class >> statefulTraits [

	<statefulTraits>
	^ {}
]
