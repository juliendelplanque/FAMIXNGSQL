Class {
	#name : #FamixNGSQLNamurTTableAccess,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#table => FMOne type: #FamixNGSQLNamurTTable opposite: #accesses',
		'#accessingCRUDQuery => FMOne type: #FamixNGSQLNamurTCRUDQuery opposite: #columnsAccessed'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTTableAccess class >> annotation [

	<MSEClass: #TTableAccess super: #FmxTraitEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #accessing }
FamixNGSQLNamurTTableAccess >> accessingCRUDQuery [

	<container>

	^ accessingCRUDQuery
]

{ #category : #accessing }
FamixNGSQLNamurTTableAccess >> accessingCRUDQuery: anObject [

	accessingCRUDQuery := anObject

]

{ #category : #accessing }
FamixNGSQLNamurTTableAccess >> table [

	^ table
]

{ #category : #accessing }
FamixNGSQLNamurTTableAccess >> table: anObject [

	table := anObject

]
