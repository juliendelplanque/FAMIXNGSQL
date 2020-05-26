Trait {
	#name : #FmxSQLTWithCursor,
	#instVars : [
		'#cursors => FMMany type: #FmxSQLCursor opposite: #parentBehaviouralEntity'
	],
	#category : 'FamixNGSQL-Traits'
}

{ #category : #meta }
FmxSQLTWithCursor classSide >> annotation [

	<MSEClass: #TWithCursor super: #Trait>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTWithCursor >> addCursors: anObject [
	<generated>
	^ self cursors add: anObject
]

{ #category : #accessing }
FmxSQLTWithCursor >> cursors [
	"Relation named: #cursors type: #FmxSQLCursor opposite: #parentBehaviouralEntity"

	<generated>
	^ cursors
]

{ #category : #accessing }
FmxSQLTWithCursor >> cursors: anObject [

	<generated>
	cursors value: anObject

]

{ #category : #navigation }
FmxSQLTWithCursor >> cursorsGroup [
	<generated>
	<navigation: 'Cursors'>
	^ MooseGroup withAll: self cursors asSet
]
