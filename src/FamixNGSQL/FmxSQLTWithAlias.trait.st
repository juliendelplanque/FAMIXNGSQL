Trait {
	#name : #FmxSQLTWithAlias,
	#instVars : [
		'#aliases => FMMany type: #FmxSQLAlias opposite: #parentBehaviouralEntity'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithAlias classSide >> annotation [

	<MSEClass: #TWithAlias super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTWithAlias >> addAliases: anObject [
	<generated>
	^ self aliases add: anObject
]

{ #category : #accessing }
FmxSQLTWithAlias >> aliases [
	"Relation named: #aliases type: #FmxSQLAlias opposite: #parentBehaviouralEntity"

	<generated>
	^ aliases
]

{ #category : #accessing }
FmxSQLTWithAlias >> aliases: anObject [

	<generated>
	aliases value: anObject

]

{ #category : #navigation }
FmxSQLTWithAlias >> aliasesGroup [
	<generated>
	<navigation: 'Aliases'>
	^ MooseGroup withAll: self aliases asSet
]
