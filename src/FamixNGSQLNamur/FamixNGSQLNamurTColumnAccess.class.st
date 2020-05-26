Class {
	#name : #FamixNGSQLNamurTColumnAccess,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#column => FMOne type: #FamixNGSQLNamurTColumn opposite: #accesses',
		'#accessingStoredProcedures => FMOne type: #FamixNGSQLNamurTStoredProcedure opposite: #columnAccesses',
		'#accessingCRUDQuery => FMOne type: #FamixNGSQLNamurTCRUDQuery opposite: #columnsAccessed'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTColumnAccess class >> annotation [

	<MSEClass: #TColumnAccess super: #FmxTraitEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #accessing }
FamixNGSQLNamurTColumnAccess >> accessingCRUDQuery [

	<container>

	^ accessingCRUDQuery
]

{ #category : #accessing }
FamixNGSQLNamurTColumnAccess >> accessingCRUDQuery: anObject [

	accessingCRUDQuery := anObject

]

{ #category : #accessing }
FamixNGSQLNamurTColumnAccess >> accessingStoredProcedures [

	<container>

	^ accessingStoredProcedures
]

{ #category : #accessing }
FamixNGSQLNamurTColumnAccess >> accessingStoredProcedures: anObject [

	accessingStoredProcedures := anObject

]

{ #category : #accessing }
FamixNGSQLNamurTColumnAccess >> column [

	^ column
]

{ #category : #accessing }
FamixNGSQLNamurTColumnAccess >> column: anObject [

	column := anObject

]
