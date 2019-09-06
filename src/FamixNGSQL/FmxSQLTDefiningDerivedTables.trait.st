Trait {
	#name : #FmxSQLTDefiningDerivedTables,
	#instVars : [
		'#derivedTablesDefined => FMMany type: #FmxSQLDerivedTable opposite: #parentQuery'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTDefiningDerivedTables classSide >> annotation [

	<MSEClass: #TDefiningDerivedTables super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTDefiningDerivedTables >> addDerivedTablesDefined: anObject [
	<generated>
	^ self derivedTablesDefined add: anObject
]

{ #category : #accessing }
FmxSQLTDefiningDerivedTables >> derivedTablesDefined [
	"Relation named: #derivedTablesDefined type: #FmxSQLDerivedTable opposite: #parentQuery"

	<generated>
	^ derivedTablesDefined
]

{ #category : #accessing }
FmxSQLTDefiningDerivedTables >> derivedTablesDefined: anObject [

	<generated>
	derivedTablesDefined value: anObject

]

{ #category : #navigation }
FmxSQLTDefiningDerivedTables >> derivedTablesDefinedGroup [
	<generated>
	<navigation: 'DerivedTablesDefined'>
	^ MooseGroup withAll: self derivedTablesDefined asSet
]
