Class {
	#name : #FamixNGSQLNamurCRUDQuery,
	#superclass : #FamixNGSQLNamurQuery,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurCRUDQuery class >> annotation [

	<MSEClass: #CRUDQuery super: #FamixNGSQLNamurQuery>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurCRUDQuery class >> statefulTraits [

	<statefulTraits>
	^ {FamixNGSQLNamurTCRUDQuery}
]
