Trait {
	#name : #FmxSQLTWithQualifiedReference,
	#instVars : [
		'#qualifiedReference => FMOne type: #FmxSQLReference opposite: #references'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithQualifiedReference classSide >> annotation [

	<MSEClass: #TWithQualifiedReference super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTWithQualifiedReference >> qualifiedReference [
	"Relation named: #qualifiedReference type: #FmxSQLQualifiedReference opposite: #references"

	<generated>
	^ qualifiedReference
]

{ #category : #accessing }
FmxSQLTWithQualifiedReference >> qualifiedReference: anObject [

	<generated>
	qualifiedReference := anObject

]
