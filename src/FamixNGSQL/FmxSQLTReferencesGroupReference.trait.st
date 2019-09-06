Trait {
	#name : #FmxSQLTReferencesGroupReference,
	#instVars : [
		'#source => FMOne type: #FmxSQLTWithReferencesGroupReference opposite: #outgoingReferencesGroupReferences',
		'#referencesGroup => FMOne type: #FmxSQLReferencesGroup opposite: #incomingReferencesGroupReference'
	],
	#category : #'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTReferencesGroupReference classSide >> annotation [

	<MSEClass: #TReferencesGroupReference super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLTReferencesGroupReference >> referencesGroup [
	"Relation named: #referencesGroup type: #FmxSQLReferencesGroup opposite: #incomingReferencesGroupReference"

	<generated>
	^ referencesGroup
]

{ #category : #accessing }
FmxSQLTReferencesGroupReference >> referencesGroup: anObject [

	<generated>
	referencesGroup := anObject

]

{ #category : #accessing }
FmxSQLTReferencesGroupReference >> source [
	"Relation named: #source type: #FmxSQLTWithReferencesGroupReference opposite: #outgoingReferencesGroupReferences"

	<generated>
	<container>
	^ source
]

{ #category : #accessing }
FmxSQLTReferencesGroupReference >> source: anObject [

	<generated>
	source := anObject

]

{ #category : #navigation }
FmxSQLTReferencesGroupReference >> sourceGroup [
	<generated>
	<navigation: 'Source'>
	^ MooseGroup with: self source
]
