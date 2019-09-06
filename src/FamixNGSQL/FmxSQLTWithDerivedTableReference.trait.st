Trait {
	#name : #FmxSQLTWithDerivedTableReference,
	#instVars : [
		'#outgoingDerivedTableReferences => FMMany type: #FmxSQLDerivedTableReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithDerivedTableReference classSide >> annotation [

	<MSEClass: #TWithDerivedTableReference super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTWithDerivedTableReference >> outgoingDerivedTableReferences [
	"Relation named: #outgoingDerivedTableReferences type: #FmxSQLDerivedTableReference opposite: #source"

	<generated>
	^ outgoingDerivedTableReferences
]

{ #category : #accessing }
FmxSQLTWithDerivedTableReference >> outgoingDerivedTableReferences: anObject [

	<generated>
	outgoingDerivedTableReferences value: anObject

]
