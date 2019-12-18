Extension { #name : #FmxSQLTable }

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
FmxSQLTable >> gtColumnsIn: composite [
	<gtInspectorPresentationOrder: 0>
	^ composite fastTable
		title: 'Columns';
		display: [ (self columns reject: [ :c | c name = 'tableoid' ]) asArray ];
		beMultiple;
		wantsAutomaticRefresh: true;
		column: 'Column name' evaluated: [ :column | column name ];
		column: 'Type' evaluated: [ :column | column type name ];
		column: 'Has PK?' evaluated: [ :column | column hasPrimaryKey ];
		send: [ :result |
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]
