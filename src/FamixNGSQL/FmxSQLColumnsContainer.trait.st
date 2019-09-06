"
I am an abstract super class for entities that contain columns. Two of my well-known subclasses are the table and the view.
"
Trait {
	#name : #FmxSQLColumnsContainer,
	#instVars : [
		'#columns => FMMany type: #FmxSQLTColumn opposite: #columnsContainer'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLColumnsContainer classSide >> annotation [

	<MSEClass: #ColumnsContainer super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLColumnsContainer >> addColumns: anObject [
	<generated>
	^ self columns add: anObject
]

{ #category : #accessing }
FmxSQLColumnsContainer >> columnNamed: aString [
	^ self columns detect: [ :column | column name = aString ]
]

{ #category : #accessing }
FmxSQLColumnsContainer >> columns [
	"Relation named: #columns type: #FmxSQLTColumn opposite: #columnsContainer"

	<generated>
	^ columns
]

{ #category : #accessing }
FmxSQLColumnsContainer >> columns: anObject [

	<generated>
	columns value: anObject

]

{ #category : #navigation }
FmxSQLColumnsContainer >> columnsGroup [
	<generated>
	<navigation: 'Columns'>
	^ MooseGroup withAll: self columns asSet
]
