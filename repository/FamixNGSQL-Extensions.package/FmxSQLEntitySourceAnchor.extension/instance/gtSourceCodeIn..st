*FamixNGSQL-Extensions
gtSourceCodeIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite text
		title: 'Source code';
		display: [ self  ];
		format: [ :t | self entity sourceCodeAsText ];
		withLineNumbers: true;
		initialize: [ :presentation | presentation selectionInterval: (self start to: self end) ];
		yourself