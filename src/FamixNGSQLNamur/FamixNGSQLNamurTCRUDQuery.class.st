Class {
	#name : #FamixNGSQLNamurTCRUDQuery,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#columnsAccessed => FMMany type: #FamixNGSQLNamurTColumnAccess opposite: #accessingCRUDQuery',
		'#storedProcedure => FMOne type: #FamixNGSQLNamurTStoredProcedure opposite: #crudQueries'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTCRUDQuery class >> annotation [

	<MSEClass: #TCRUDQuery super: #FmxTraitEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #accessing }
FamixNGSQLNamurTCRUDQuery >> columnsAccessed [

	^ columnsAccessed
]

{ #category : #accessing }
FamixNGSQLNamurTCRUDQuery >> columnsAccessed: anObject [

	columnsAccessed value: anObject

]

{ #category : #accessing }
FamixNGSQLNamurTCRUDQuery >> storedProcedure [

	<container>

	^ storedProcedure
]

{ #category : #accessing }
FamixNGSQLNamurTCRUDQuery >> storedProcedure: anObject [

	storedProcedure := anObject

]
