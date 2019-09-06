Trait {
	#name : #FmxSQLTWithCursorReference,
	#instVars : [
		'#outgoingCursorReferences => FMMany type: #FmxSQLCursorReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithCursorReference classSide >> annotation [

	<MSEClass: #TWithCursorReference super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTWithCursorReference >> outgoingCursorReferences [
	"Relation named: #outgoingCursorReferences type: #FmxSQLCursorReference opposite: #source"

	<generated>
	^ outgoingCursorReferences
]

{ #category : #accessing }
FmxSQLTWithCursorReference >> outgoingCursorReferences: anObject [

	<generated>
	outgoingCursorReferences value: anObject

]
