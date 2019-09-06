Extension { #name : #MooseModel }

{ #category : #'*FamixNGSQL-Importer' }
MooseModel >> errorReport [
	^ self propertyNamed: #errorReport
]

{ #category : #'*FamixNGSQL-Importer' }
MooseModel >> errorReport: anErrorReport [
	^ self propertyNamed: #errorReport put: anErrorReport
]

{ #category : #'*FamixNGSQL-Importer' }
MooseModel >> gtInspectorErrorReportIn: composite [
	<gtInspectorPresentationOrder: 20>
	^ composite fastTable
		title: 'Importation errors';
		display: [ self errorReport errors ];
		beMultiple;
		enableElementIndex;
		wantsAutomaticRefresh: true;
		column: 'Index' evaluated: [ :value :ibdex | ibdex asString ] width: 50;
		column: 'Errors' evaluated: [ :value | GTObjectPrinter asTruncatedTextFrom: value ];
		send: [ :result | 
			result isNil
				ifTrue: [ nil ]
				ifFalse: [ result size = 1 
					ifTrue: [result anyOne ]  
					ifFalse: [self species withAll: result]]]
]
