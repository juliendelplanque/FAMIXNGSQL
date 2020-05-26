Trait {
	#name : #FmxSQLTWithReferencesGroupReference,
	#instVars : [
		'#outgoingReferencesGroupReferences => FMMany type: #FmxSQLTReferencesGroupReference opposite: #source'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithReferencesGroupReference classSide >> annotation [

	<MSEClass: #TWithReferencesGroupReference super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTWithReferencesGroupReference >> addOutgoingReferencesGroupReferences: anObject [
	<generated>
	^ self outgoingReferencesGroupReferences add: anObject
]

{ #category : #accessing }
FmxSQLTWithReferencesGroupReference >> outgoingReferencesGroupReferences [
	"Relation named: #outgoingReferencesGroupReferences type: #FmxSQLTReferencesGroupReference opposite: #source"

	<generated>
	^ outgoingReferencesGroupReferences
]

{ #category : #accessing }
FmxSQLTWithReferencesGroupReference >> outgoingReferencesGroupReferences: anObject [

	<generated>
	outgoingReferencesGroupReferences value: anObject

]

{ #category : #navigation }
FmxSQLTWithReferencesGroupReference >> outgoingReferencesGroupReferencesGroup [
	<generated>
	<navigation: 'OutgoingReferencesGroupReferences'>
	^ MooseGroup withAll: self outgoingReferencesGroupReferences asSet
]
