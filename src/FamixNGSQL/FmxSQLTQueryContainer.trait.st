"
I am an abstract super class for behavioural entities that can contain queries in their source code.
"
Trait {
	#name : #FmxSQLTQueryContainer,
	#instVars : [
		'#queries => FMMany type: #FmxSQLCRUDQuery opposite: #container'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTQueryContainer classSide >> annotation [

	<MSEClass: #TQueryContainer super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTQueryContainer >> addQueries: anObject [
	<generated>
	^ self queries add: anObject
]

{ #category : #testing }
FmxSQLTQueryContainer >> isQueryContainer [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLTQueryContainer >> queries [
	"Relation named: #queries type: #FmxSQLCRUDQuery opposite: #container"

	<generated>
	^ queries
]

{ #category : #accessing }
FmxSQLTQueryContainer >> queries: anObject [

	<generated>
	queries value: anObject

]

{ #category : #navigation }
FmxSQLTQueryContainer >> queriesGroup [
	<generated>
	<navigation: 'Queries'>
	^ MooseGroup withAll: self queries asSet
]
