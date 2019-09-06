Extension { #name : #FmxSQLStoredProcedure }

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
FmxSQLStoredProcedure >> gtSourceCodeIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite text
		title: 'Source code';
		display: [ self  ];
		format: [ :t | self sourceCodeAsText ];
		withLineNumbers: true;
		yourself
]
