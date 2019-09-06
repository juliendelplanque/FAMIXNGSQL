Trait {
	#name : #FmxSQLTWithColumnReference,
	#instVars : [
		'#outgoingColumnReferences => FMMany type: #FmxSQLColumnReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithColumnReference classSide >> annotation [

	<MSEClass: #TWithColumnReference super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTWithColumnReference >> outgoingColumnReferences [
	"Relation named: #outgoingColumnReferences type: #FmxSQLColumnReference opposite: #source"

	<generated>
	^ outgoingColumnReferences
]

{ #category : #accessing }
FmxSQLTWithColumnReference >> outgoingColumnReferences: anObject [

	<generated>
	outgoingColumnReferences value: anObject

]
