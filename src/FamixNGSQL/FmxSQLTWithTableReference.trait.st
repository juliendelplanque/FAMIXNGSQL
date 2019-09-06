Trait {
	#name : #FmxSQLTWithTableReference,
	#instVars : [
		'#outgoingTableReferences => FMMany type: #FmxSQLTableReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithTableReference classSide >> annotation [

	<MSEClass: #TWithTableReference super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTWithTableReference >> outgoingTableReferences [
	"Relation named: #outgoingTableReferences type: #FmxSQLTableReference opposite: #source"

	<generated>
	^ outgoingTableReferences
]

{ #category : #accessing }
FmxSQLTWithTableReference >> outgoingTableReferences: anObject [

	<generated>
	outgoingTableReferences value: anObject

]
