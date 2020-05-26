Class {
	#name : #FamixNGSQLNamurTStoredProcedure,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#calls => FMMany type: #FamixNGSQLNamurTStoredProcedureCall opposite: #storedProcedure',
		'#columnAccesses => FMMany type: #FamixNGSQLNamurTColumnAccess opposite: #accessingStoredProcedures',
		'#crudQueries => FMMany type: #FamixNGSQLNamurTCRUDQuery opposite: #storedProcedure'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTStoredProcedure class >> annotation [

	<MSEClass: #TStoredProcedure super: #FmxTraitEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedure >> calls [

	^ calls
]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedure >> calls: anObject [

	calls value: anObject

]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedure >> columnAccesses [

	^ columnAccesses
]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedure >> columnAccesses: anObject [

	columnAccesses value: anObject

]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedure >> crudQueries [

	^ crudQueries
]

{ #category : #accessing }
FamixNGSQLNamurTStoredProcedure >> crudQueries: anObject [

	crudQueries value: anObject

]
