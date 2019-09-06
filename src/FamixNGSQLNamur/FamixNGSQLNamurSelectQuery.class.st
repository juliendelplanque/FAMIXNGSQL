Class {
	#name : #FamixNGSQLNamurSelectQuery,
	#superclass : #FamixNGSQLNamurCRUDQuery,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurSelectQuery class >> annotation [

	<MSEClass: #SelectQuery super: #FamixNGSQLNamurCRUDQuery>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurSelectQuery class >> statefulTraits [

	<statefulTraits>
	^ {FamixNGSQLNamurTSelectQuery}
]
