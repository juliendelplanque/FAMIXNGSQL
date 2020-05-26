Extension { #name : #FmxSQLReference }

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
FmxSQLReference >> gtSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite text
		title: 'Source code';
		display: [ self sourceAnchorIfNone: [ nil ] ];
		format: [ :t | 
			[ self sourceAnchor entity sourceCodeAsText ] on: FmxSQLNoSourceAnchor do: [ 'No source anchor' asText ] ];
		withLineNumbers: true;
		initialize: [ :presentation | 
			[ self sourceAnchor in: [ :anchor |
				presentation selectionInterval: (anchor start to: anchor end) ]
			 ] on: FmxSQLNoSourceAnchor do: [ "Nothing on purpose" ] ];
		yourself
]
