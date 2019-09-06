Extension { #name : #FmxSQLClause }

{ #category : #'*FamixNGSQL-Extensions' }
FmxSQLClause >> gtSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite text
		title: 'Source code';
		display: [ self  ];
		format: [ :t | self sourceAnchor
				ifNil: [ 'No source anchor' ]
				ifNotNil: [ :anchor | anchor entity sourceCodeAsText ] ];
		withLineNumbers: true;
		initialize: [ :presentation | 
			self sourceAnchor
				ifNotNil: [ :anchor | presentation selectionInterval: (anchor start to: anchor end) ] ];
		yourself
]
