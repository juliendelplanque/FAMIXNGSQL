Trait {
	#name : #FmxSQLTWithNamespaceReference,
	#instVars : [
		'#outgoingNamespaceReference => FMMany type: #FmxSQLNamespaceReference opposite: #source'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithNamespaceReference classSide >> annotation [

	<MSEClass: #TWithNamespaceReference super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTWithNamespaceReference >> outgoingNamespaceReference [
	"Relation named: #outgoingNamespaceReference type: #FmxSQLNamespaceReference opposite: #source"

	<generated>
	^ outgoingNamespaceReference
]

{ #category : #accessing }
FmxSQLTWithNamespaceReference >> outgoingNamespaceReference: anObject [

	<generated>
	outgoingNamespaceReference value: anObject

]
