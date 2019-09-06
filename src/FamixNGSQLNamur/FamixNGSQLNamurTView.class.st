Class {
	#name : #FamixNGSQLNamurTView,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#selectQuery => FMOne type: #FamixNGSQLNamurTSelectQuery opposite: #viewDefined'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTView class >> annotation [

	<MSEClass: #TView super: #FmxTraitEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #accessing }
FamixNGSQLNamurTView >> selectQuery [

	^ selectQuery
]

{ #category : #accessing }
FamixNGSQLNamurTView >> selectQuery: anObject [

	selectQuery := anObject

]
