Class {
	#name : #FamixNGSQLNamurTConstraint,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#calls => FMMany type: #FamixNGSQLNamurTStoredProcedureCall opposite: #callingConstraints',
		'#table => FMOne type: #FamixNGSQLNamurTTable opposite: #constraints'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTConstraint class >> annotation [

	<MSEClass: #TConstraint super: #FmxTraitEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #accessing }
FamixNGSQLNamurTConstraint >> calls [

	^ calls
]

{ #category : #accessing }
FamixNGSQLNamurTConstraint >> calls: anObject [

	calls value: anObject

]

{ #category : #accessing }
FamixNGSQLNamurTConstraint >> table [

	<container>

	^ table
]

{ #category : #accessing }
FamixNGSQLNamurTConstraint >> table: anObject [

	table := anObject

]
