as yet unclassified
resolveNewOrOldIndentifier: aSRIdentifierWithNode
	| referenceClass |
	referenceClass := aSRIdentifierWithNode identifier = 'new'
		ifTrue: [ FmxSQLNewReference ]
		ifFalse: [ FmxSQLOldReference ].
	
	^ referenceClass new
		source: self currentEntity;
		candidates: (self function triggers collect: #table);
		mooseModel: model;
		yourself