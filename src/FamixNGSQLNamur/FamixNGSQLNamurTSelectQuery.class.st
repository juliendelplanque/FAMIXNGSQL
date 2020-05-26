Class {
	#name : #FamixNGSQLNamurTSelectQuery,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#calls => FMMany type: #FamixNGSQLNamurTStoredProcedureCall opposite: #callingSelectQuery',
		'#viewDefined => FMOne type: #FamixNGSQLNamurTView opposite: #selectQuery'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTSelectQuery class >> annotation [

	<MSEClass: #TSelectQuery super: #FmxTraitEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #accessing }
FamixNGSQLNamurTSelectQuery >> calls [

	^ calls
]

{ #category : #accessing }
FamixNGSQLNamurTSelectQuery >> calls: anObject [

	calls value: anObject

]

{ #category : #accessing }
FamixNGSQLNamurTSelectQuery >> viewDefined [

	<container>

	^ viewDefined
]

{ #category : #accessing }
FamixNGSQLNamurTSelectQuery >> viewDefined: anObject [

	viewDefined := anObject

]
