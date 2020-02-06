Class {
	#name : #FmxSQLConceptsIdentificationVisualisation,
	#superclass : #TLVisualization,
	#instVars : [
		'tables'
	],
	#category : #FAMIXNGSQLAnalysis
}

{ #category : #adding }
FmxSQLConceptsIdentificationVisualisation >> addLegendEntryForIncomingHighlight [
	self legend
		description: 'Incoming dependencies'
		forConnectionStyle:
			(TLStyleSheet new
				color: MDLColor blue;
				fontSize: '2em')
		icon: '→'
]

{ #category : #adding }
FmxSQLConceptsIdentificationVisualisation >> addLegendEntryForOutgoingHighlight [
	self legend
		description: 'Outgoing dependencies'
		forConnectionStyle:
			(TLStyleSheet new
				color: MDLColor orange;
				fontSize: '2em')
		icon: '→'
]

{ #category : #building }
FmxSQLConceptsIdentificationVisualisation >> buildLegend [
	super buildLegend.
	self legend
		backgroundDescription: [ :entity | (entity conceptIdIfAbsent: [ 'No tag' ]) asString ]
			forNodes: [ self tablesGroup allNodesRecursively ];
		nodeShapeDescription: [ :entity | entity class printString ]
			forNodes: [ self allNodesRecursively ];
		description: 'FK'
			forConnectionStyle:
			(TLStyleSheet new
				color: MDLColor black;
				fontSize: '2em')
			icon: '→'.
	self
		addLegendEntryForOutgoingHighlight;
		addLegendEntryForIncomingHighlight
]

{ #category : #building }
FmxSQLConceptsIdentificationVisualisation >> buildVisualization [
	| colors tablesGroupedByConcept |
	colors := Color wheel: 11.
	super buildVisualization.
	tablesGroupedByConcept := self tables groupedBy: [ :t | t conceptIdIfAbsent: [ 10 ] ].
	tablesGroupedByConcept keysAndValuesDo: [ :groupId :tablesWithSameConcept |
		(self tablesGroup > groupId asString asSymbol)
			addNodesFromEntities: tablesWithSameConcept;
			layout: (TLLinearLayout gap: 25 ratio: 16/9) ].
	"self tablesGroup
		addNodesFromEntities: (self tables sorted: [ :e | e conceptIdIfAbsent: [ 10 ] ] ascending)."
	self tablesGroup styleSheet
		backgroundColor: [ :table | colors at: (table conceptIdIfAbsent: [ 10 ]) + 1 ].
	self tablesGroup allNodes
		do: [ :tableNode | 
			tableNode entity incomingForeignKeyConstraints
				do: [ :constraint | 
					(self tablesGroup nodeForEntity: constraint referencingColumnsTable)
						connectTo: tableNode ] ]. "connectIfNotTo: to avoid duplication"
	self tablesGroup addInteractions: self defaultInteractionsList.
	self tablesGroup layout: (TLCircularLayout gap: 100)
]

{ #category : #adding }
FmxSQLConceptsIdentificationVisualisation >> defaultInteractionsList [
    ^ {(TLStyleCustomizationAction
        custom: [ :style :drawable | self setOutgoingConnectionsHighlightStyleTo: style for: drawable ]
        target: [ :aDrawable | aDrawable incomingConnections flatCollectAsSet: #withConnectedNodes ]) onMouseOver.
    (TLStyleCustomizationAction
        custom: [ :style :drawable | self setIncomingConnectionsHighlightStyleTo: style for: drawable ]
        target: [ :aDrawable | aDrawable outgoingConnections flatCollectAsSet: #withConnectedNodes ]) onMouseOver}
]

{ #category : #adding }
FmxSQLConceptsIdentificationVisualisation >> setIncomingConnectionsHighlightStyleTo: aStylesheet [
	aStylesheet
		color: MDLColor orange;
		width: 3
]

{ #category : #adding }
FmxSQLConceptsIdentificationVisualisation >> setIncomingConnectionsHighlightStyleTo: aStylesheet for: aDrawable [
	aDrawable isConnection
		ifTrue: [ self setIncomingConnectionsHighlightStyleTo: aStylesheet ]
		ifFalse: [ aStylesheet
				labelSize: 20;
				textColor: MDLColor orange ].
	aDrawable isNode
		ifTrue: [ aStylesheet nodeLabel: #name position: #top ]
]

{ #category : #adding }
FmxSQLConceptsIdentificationVisualisation >> setOutgoingConnectionsHighlightStyleTo: aStylesheet [
	aStylesheet
		color: MDLColor blue;
		width: 3
]

{ #category : #adding }
FmxSQLConceptsIdentificationVisualisation >> setOutgoingConnectionsHighlightStyleTo: aStylesheet for: aDrawable [
	aDrawable isConnection
		ifTrue: [ self setOutgoingConnectionsHighlightStyleTo: aStylesheet ]
		ifFalse: [ aStylesheet
				labelSize: 20;
				textColor: MDLColor blue ].
	aDrawable isNode
		ifTrue: [ aStylesheet nodeLabel: #name position: #top ]
]

{ #category : #accessing }
FmxSQLConceptsIdentificationVisualisation >> tables [
	^ tables
]

{ #category : #accessing }
FmxSQLConceptsIdentificationVisualisation >> tables: anObject [
	tables := anObject
]

{ #category : #building }
FmxSQLConceptsIdentificationVisualisation >> tablesGroup [
	^ self > #tables
]
