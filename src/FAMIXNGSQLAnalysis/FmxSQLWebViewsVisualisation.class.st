Class {
	#name : #FmxSQLWebViewsVisualisation,
	#superclass : #TLVisualization,
	#instVars : [
		'views'
	],
	#category : #'FAMIXNGSQLAnalysis-ConceptsIdentification'
}

{ #category : #building }
FmxSQLWebViewsVisualisation >> buildLegend [
	super buildLegend.
	self legend
		"description: 'Web views' forBorderShape: TLRectangle;"
		description: 'View' forBorderShape: (self shapeForEntityType at: FmxSQLView);
		description: 'Table' forBorderShape: (self shapeForEntityType at: FmxSQLTable).
		"backgroundDescription: [ :entity | (entity conceptIdIfAbsent: [ 'No tag' ]) asString ]
			forNodes: [ self viewsGroup allNodesRecursively ];"
		"description: 'FK'
			forConnectionStyle:
			(TLStyleSheet new
				color: MDLColor black;
				fontSize: '2em')
			icon: '→';
		description: 'Table inheritance'
			forConnectionStyle:
			(TLStyleSheet new
				color: MDLColor red;
				fontSize: '2em')
			icon: '→'.
	self
		addLegendEntryForOutgoingHighlight;
		addLegendEntryForIncomingHighlight"
]

{ #category : #building }
FmxSQLWebViewsVisualisation >> buildVisualization [
	| colors otherEntities|
	super buildVisualization.
	colors := Color wheel: 11.
	
	self webViewsGroup
		addNodesFromEntities: self views;
		layout: (TLLinearLayout gap: 20 perLine: 10);
		shape: [ :e | (self shapeForEntityType at: e class) ].
	
	"self webViewsGroup styleSheet
		nodeLabel: #name position: #top."
		
	otherEntities := self views flatCollect: [ :v |
		((v queryAllOutgoing allAtAnyScope: self scope) \ { v }) reject: #isStub ] as: Set.
	
	self otherEntitiesGroup
		layout: (TLLinearLayout gap: 20 perLine: 10);
		addNodesFromEntities: otherEntities.
		
	self
		backgroundColor: [ :e | (self views includes: e) ifTrue:[ (Color r: 0.385 g: 0.7000000000000001 b: 0.07 alpha: 1.0) ] ifFalse: [ Color r: 0.7000000000000001 g: 0.07 b: 0.07 alpha: 1.0 ] ].
	
	"self otherEntitiesGroup styleSheet
		nodeLabel: #name position: #top."
		
	self webViewsGroup allNodes do: [ :node |
		((node entity queryAllOutgoing allAtAnyScope: self scope) \ { node entity }) reject: #isStub thenDo: [ :e |
			(self otherEntitiesGroup nodeForEntity: e)
				connectFrom: node ] ]
	"self tablesGroup styleSheet
		backgroundColor: [ :table | colors at: (table conceptIdIfAbsent: [ 10 ]) + 1 ].
	self tablesGroup allNodes
		do: [ :tableNode | 
			tableNode entity incomingForeignKeyConstraints
				do: [ :constraint | 
					(self tablesGroup nodeForEntity: constraint referencingColumnsTable)
						connectTo: tableNode ].
			tableNode entity hasSuperTable
				ifTrue: [
					|superTableConnection|
					superTableConnection := tableNode connectTo: (self tablesGroup nodeForEntity: tableNode entity superTable).
					superTableConnection styleSheet color: Color red ] ].
	self tablesGroup addInteractions: self defaultInteractionsList.
	self tablesGroup layout: (TLCircularLayout gap: 100).
	
	self viewsGroup
		addNodesFromEntities: self views;
		shape: TLHexagon.
	
	self viewsGroup allNodes
		do: [ :viewNode |
			(viewNode entity queryOutgoing: FmxSQLTableReference) reject: [ :tableRef | tableRef table name = 'pg_class' ] thenDo: [ :tableReference |
				viewNode connectIfNotTo: (self tablesGroup nodeForEntity: tableReference table) ] ].
		
	self viewsGroup addInteractions: self defaultInteractionsList."
]

{ #category : #accessing }
FmxSQLWebViewsVisualisation >> colorForEntityType [
	^ ((Color wheel: self scope size) with: self scope collect: [ :color :entityType |
		entityType -> color ]) asDictionary
]

{ #category : #adding }
FmxSQLWebViewsVisualisation >> defaultInteractionsList [
    ^ {(TLStyleCustomizationAction
        custom: [ :style :drawable | self setOutgoingConnectionsHighlightStyleTo: style for: drawable ]
        target: [ :aDrawable | aDrawable incomingConnections flatCollectAsSet: #withConnectedNodes ]) onMouseOver.
    (TLStyleCustomizationAction
        custom: [ :style :drawable | self setIncomingConnectionsHighlightStyleTo: style for: drawable ]
        target: [ :aDrawable | aDrawable outgoingConnections flatCollectAsSet: #withConnectedNodes ]) onMouseOver}
]

{ #category : #'as yet unclassified' }
FmxSQLWebViewsVisualisation >> otherEntitiesGroup [
	^ self > #other_entities
]

{ #category : #accessing }
FmxSQLWebViewsVisualisation >> scope [
	^ { FmxSQLTable. FmxSQLView. FmxSQLStoredProcedure. FmxSQLTrigger }
]

{ #category : #initialization }
FmxSQLWebViewsVisualisation >> setIncomingConnectionsHighlightStyleTo: aStylesheet [
	aStylesheet
		color: MDLColor orange;
		width: 3
]

{ #category : #initialization }
FmxSQLWebViewsVisualisation >> setIncomingConnectionsHighlightStyleTo: aStylesheet for: aDrawable [
	aDrawable isConnection
		ifTrue: [ self setIncomingConnectionsHighlightStyleTo: aStylesheet ]
		ifFalse: [ aStylesheet
				labelSize: 20;
				textColor: MDLColor orange ].
	aDrawable isNode
		ifTrue: [ aStylesheet nodeLabel: #name position: #top ]
]

{ #category : #initialization }
FmxSQLWebViewsVisualisation >> setOutgoingConnectionsHighlightStyleTo: aStylesheet [
	aStylesheet
		color: MDLColor blue;
		width: 3
]

{ #category : #initialization }
FmxSQLWebViewsVisualisation >> setOutgoingConnectionsHighlightStyleTo: aStylesheet for: aDrawable [
	aDrawable isConnection
		ifTrue: [ self setOutgoingConnectionsHighlightStyleTo: aStylesheet ]
		ifFalse: [ aStylesheet
				labelSize: 20;
				textColor: MDLColor blue ].
	aDrawable isNode
		ifTrue: [ aStylesheet nodeLabel: #name position: #top ]
]

{ #category : #accessing }
FmxSQLWebViewsVisualisation >> shapeForEntityType [
	^ { FmxSQLTable -> TLRectangle.
		FmxSQLView -> TLEllipse
	 } asDictionary
]

{ #category : #accessing }
FmxSQLWebViewsVisualisation >> views [
	^ views
]

{ #category : #accessing }
FmxSQLWebViewsVisualisation >> views: anObject [
	views := anObject
]

{ #category : #'as yet unclassified' }
FmxSQLWebViewsVisualisation >> webViewsGroup [
	^ self > #web_views
]
