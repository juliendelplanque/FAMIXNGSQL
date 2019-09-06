Class {
	#name : #FamixNGSQLNamurTTable,
	#superclass : #FmxTraitEntity,
	#instVars : [
		'#mother => FMOne type: #FamixNGSQLNamurTTable opposite: #children',
		'#constraints => FMMany type: #FamixNGSQLNamurTConstraint opposite: #table',
		'#children => FMMany type: #FamixNGSQLNamurTTable opposite: #mother',
		'#columns => FMMany type: #FamixNGSQLNamurTColumn opposite: #table',
		'#accesses => FMMany type: #FamixNGSQLNamurTTableAccess opposite: #table'
	],
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurTTable class >> annotation [

	<MSEClass: #TTable super: #FmxTraitEntity>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #accessing }
FamixNGSQLNamurTTable >> accesses [

	^ accesses
]

{ #category : #accessing }
FamixNGSQLNamurTTable >> accesses: anObject [

	accesses value: anObject

]

{ #category : #accessing }
FamixNGSQLNamurTTable >> children [

	^ children
]

{ #category : #accessing }
FamixNGSQLNamurTTable >> children: anObject [

	children value: anObject

]

{ #category : #accessing }
FamixNGSQLNamurTTable >> columns [

	^ columns
]

{ #category : #accessing }
FamixNGSQLNamurTTable >> columns: anObject [

	columns value: anObject

]

{ #category : #accessing }
FamixNGSQLNamurTTable >> constraints [

	^ constraints
]

{ #category : #accessing }
FamixNGSQLNamurTTable >> constraints: anObject [

	constraints value: anObject

]

{ #category : #accessing }
FamixNGSQLNamurTTable >> mother [

	^ mother
]

{ #category : #accessing }
FamixNGSQLNamurTTable >> mother: anObject [

	mother := anObject

]
