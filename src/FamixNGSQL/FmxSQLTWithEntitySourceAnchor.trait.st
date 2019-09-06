Trait {
	#name : #FmxSQLTWithEntitySourceAnchor,
	#instVars : [
		'#anchorsOnIntervalsOfCode => FMMany type: #FmxSQLEntitySourceAnchor opposite: #entity'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithEntitySourceAnchor classSide >> annotation [

	<MSEClass: #TWithEntitySourceAnchor super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTWithEntitySourceAnchor >> anchorsOnIntervalsOfCode [
	"Relation named: #anchorsOnIntervalsOfCode type: #FmxSQLEntitySourceAnchor opposite: #entity"

	<generated>
	^ anchorsOnIntervalsOfCode
]

{ #category : #accessing }
FmxSQLTWithEntitySourceAnchor >> anchorsOnIntervalsOfCode: anObject [

	<generated>
	anchorsOnIntervalsOfCode value: anObject

]
