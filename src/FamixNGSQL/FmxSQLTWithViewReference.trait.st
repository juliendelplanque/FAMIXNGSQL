Trait {
	#name : #FmxSQLTWithViewReference,
	#instVars : [
		'#outgoingViewReferences => FMMany type: #FmxSQLViewReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithViewReference classSide >> annotation [

	<MSEClass: #TWithViewReference super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTWithViewReference >> outgoingViewReferences [
	"Relation named: #outgoingViewReferences type: #FmxSQLViewReference opposite: #source"

	<generated>
	^ outgoingViewReferences
]

{ #category : #accessing }
FmxSQLTWithViewReference >> outgoingViewReferences: anObject [

	<generated>
	outgoingViewReferences value: anObject

]
