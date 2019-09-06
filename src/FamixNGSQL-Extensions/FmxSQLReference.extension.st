Extension { #name : #FmxSQLReference }

{ #category : #'*FamixNGSQL-Extensions' }
FmxSQLReference >> gtSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite text
		title: 'Source code';
		display: [ self  ];
		format: [ :t | self sourceAnchor
				ifNil: [ 
					self belongsToGroup
						ifNil: [ 'No source anchor' ]
						ifNotNil: [ 
							self belongsToGroup sourceAnchor
								ifNil: [ 'No source anchor' ]
								ifNotNil: [ :anchor | anchor entity sourceCodeAsText ] ] ]
				ifNotNil: [ :anchor | anchor entity sourceCodeAsText ] ];
		withLineNumbers: true;
		initialize: [ :presentation | 
			self sourceAnchor
				ifNil: [ 
					self belongsToGroup
						ifNotNil: [ 
							self belongsToGroup sourceAnchor
								ifNotNil: [ :anchor | presentation selectionInterval: (anchor start to: anchor end) ] ] ]
				ifNotNil: [ :anchor | presentation selectionInterval: (anchor start to: anchor end) ] ];
		yourself
]
