"
I am a view. I can be used transparently as a table but I do not hold data. My data are fetched by the SELECT query which defines myself.
"
Class {
	#name : #FmxSQLView,
	#superclass : #FmxSQLNamedEntity,
	#traits : 'FamixTNamespaceEntity + FamixTWithImmediateSource + FmxSQLAbstractType + FmxSQLBehaviouralEntity + FmxSQLColumnsContainer + FmxSQLTQueryContainer',
	#classTraits : 'FamixTNamespaceEntity classTrait + FamixTWithImmediateSource classTrait + FmxSQLAbstractType classTrait + FmxSQLBehaviouralEntity classTrait + FmxSQLColumnsContainer classTrait + FmxSQLTQueryContainer classTrait',
	#instVars : [
		'#query => FMOne type: #FmxSQLSelectQuery opposite: #viewDefining',
		'#references => FMMany type: #FmxSQLViewReference opposite: #view'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLView class >> annotation [

	<MSEClass: #View super: #FmxSQLNamedEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLView >> allDependencies [
	^ self viewsDependencies , self storedProceduresDependencies
]

{ #category : #accessing }
FmxSQLView >> allDepending [
	^ self viewsDepending , self storedProceduresDepending
]

{ #category : #accessing }
FmxSQLView >> allStoredProceduresDependencies [
	"Returns the stored procedures that I depend on directly and indirectly."
	^ (self anyTreeIterator: #storedProceduresDependencies) allButFirst
]

{ #category : #accessing }
FmxSQLView >> allStoredProceduresDepending [
	"Returns the stored procedures that I depend on directly and indirectly."
	^ (self anyTreeIterator: #storedProceduresDepending) allButFirst
]

{ #category : #accessing }
FmxSQLView >> allViewsDependencies [
	"Returns the views that I depend on directly and indirectly."
	^ (self anyTreeIterator: #viewsDependencies) allButFirst
]

{ #category : #accessing }
FmxSQLView >> allViewsDepending [
	"Returns the views that I depend on directly and indirectly."
	^ (self anyTreeIterator: #viewsDepending) allButFirst
]

{ #category : #accessing }
FmxSQLView >> columnsToColumnReferences [
	| mapping |
	mapping := Dictionary new.
	(self query selectClause outgoingColumnReferences groupedBy: [ :ref | ref belongsToGroup ifNil: [ ref ] ]) keys do: [ :outgoingRef |
		mapping
			at: (self query selectClause aliases
					detect: [ :alias | (outgoingRef class = FmxSQLColumnReference and: [ alias outgoingColumnReferences anySatisfy: [ :ref | (ref sourceAnchor interval includesAll: outgoingRef sourceAnchor interval) or: [ outgoingRef sourceAnchor interval includesAll: ref sourceAnchor interval ] ] ]) or: [ alias outgoingReferencesGroupReferences includes: outgoingRef ] ]
					ifFound: [ :alias | self columnNamed: alias name ]
					ifNone: [ 
						outgoingRef class = FmxSQLReferencesGroup
							ifTrue: [ self columnNamed: outgoingRef incomingReferencesGroupReference first source name ]
							ifFalse: [ self columnNamed: outgoingRef column name ] ])
			ifPresent: [ self halt ]
			ifAbsentPut: outgoingRef ].
	^ mapping
]

{ #category : #testing }
FmxSQLView >> dependsDirectlyOn: aFmxSQLView [
	^ aFmxSQLView viewsDepending includes: self
]

{ #category : #testing }
FmxSQLView >> dependsOn: aFmxSQLView [
	^ TreeQuery breadthFirst matchAnywhere
		predicate: self asTQPredicate;
		runOn: aFmxSQLView childrenBlock: #viewsDepending
]

{ #category : #testing }
FmxSQLView >> doesNameOfColumnComesFromAlias: aFmxSQLColumn [
	| referenceOrReferenceGroup |
	referenceOrReferenceGroup := (self columnsToColumnReferences at: aFmxSQLColumn).
	referenceOrReferenceGroup class = FmxSQLReferencesGroup
		ifTrue: [ ^ true ].
	
	^ referenceOrReferenceGroup column name ~= aFmxSQLColumn name
]

{ #category : #testing }
FmxSQLView >> isView [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLView >> query [
	"Relation named: #query type: #FmxSQLSelectQuery opposite: #viewDefining"

	<generated>
	^ query
]

{ #category : #accessing }
FmxSQLView >> query: anObject [

	<generated>
	query := anObject

]

{ #category : #navigation }
FmxSQLView >> queryGroup [
	<generated>
	<navigation: 'Query'>
	^ MooseGroup with: self query
]

{ #category : #accessing }
FmxSQLView >> references [
	"Relation named: #references type: #FmxSQLViewReference opposite: #view"

	<generated>
	^ references
]

{ #category : #accessing }
FmxSQLView >> references: anObject [

	<generated>
	references value: anObject

]

{ #category : #accessing }
FmxSQLView >> sourceCodeAsText [
	^ PostgreSQLHighlighter highlightSelectQuery: self source
]

{ #category : #accessing }
FmxSQLView >> storedProceduresDependencies [
	"Returns the stored procedures that I depend on directly (I call them directly)."
	^ ((self queryOutgoing: FmxSQLStoredProcedureCall) collect: [ :ref | ref to ]) asSet
]

{ #category : #accessing }
FmxSQLView >> storedProceduresDepending [
	"Returns the views that depends on myself directly (reference myself directly)."
	^ ((self queryLocalIncoming: FmxSQLViewReference) collect: [ :ref | ref from sourcedBelonger ] thenSelect: [ :sourcedBelonger | sourcedBelonger isNotNil and: [ sourcedBelonger isStoredProcedure ] ]) asSet
]

{ #category : #accessing }
FmxSQLView >> viewsDependencies [
	"Returns the views that I depend on directly (I reference them directly)."
	^ ((self queryOutgoing: FmxSQLViewReference) collect: [ :ref | ref to ]) asSet
]

{ #category : #accessing }
FmxSQLView >> viewsDepending [
	"Returns the views that depends on myself directly (reference myself directly)."
	^ ((self queryLocalIncoming: FmxSQLViewReference) collect: [ :ref | ref source sourcedBelonger ] thenSelect: [ :sourcedBelonger | sourcedBelonger isNotNil and: [ sourcedBelonger isView ] ]) asSet
]
