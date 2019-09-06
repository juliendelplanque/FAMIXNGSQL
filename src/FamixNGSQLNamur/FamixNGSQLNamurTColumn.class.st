Class {
	#name : #FamixNGSQLNamurTColumn,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#table => FMOne type: #FamixNGSQLNamurTTable opposite: #columns',
		'#accesses => FMMany type: #FamixNGSQLNamurTColumnAccess opposite: #column'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTColumn class >> annotation [

	<MSEClass: #TColumn super: #FmxTraitEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #accessing }
FamixNGSQLNamurTColumn >> accesses [

	^ accesses
]

{ #category : #accessing }
FamixNGSQLNamurTColumn >> accesses: anObject [

	accesses value: anObject

]

{ #category : #accessing }
FamixNGSQLNamurTColumn >> table [

	<container>

	^ table
]

{ #category : #accessing }
FamixNGSQLNamurTColumn >> table: anObject [

	table := anObject

]
