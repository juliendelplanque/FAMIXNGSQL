Class {
	#name : #FmxSQLClassificationDataAnalysis,
	#superclass : #Object,
	#instVars : [
		'directory'
	],
	#category : #'FAMIXNGSQLAnalysis-ConceptsIdentification'
}

{ #category : #accessing }
FmxSQLClassificationDataAnalysis >> allEntitiesToFeatureGroup [
	^ (self classifiedEntitiesArray collect: [ :a | (a first: 2), {a last} ]) ,
		(self evaluatedClassificationArray collect: [ :a | (a first: 2), {a last} ])
]

{ #category : #accessing }
FmxSQLClassificationDataAnalysis >> classifiedEntitiesArray [
	^ self classifiedEntitiesFile readStreamDo: [ :stream |
		((NeoCSVReader on: stream)
			separator: $;;
			skipHeader;
			addField;
			addField;
			addField;
			addField;
			addIntegerField;
			addField;
			upToEnd) collect: [ :array | (array first: 2) , { array reversed second } ] ]
]

{ #category : #accessing }
FmxSQLClassificationDataAnalysis >> classifiedEntitiesFile [
	^ self directory / 'classified_entities.csv'
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> correctlyAutomaticallyClassifiedStoredProceduresCount [
	^ (self evaluatedClassificationArray
			select: [ :array | array first = 'StoredProcedure' and: [ array fourth ] ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> correctlyAutomaticallyClassifiedTriggerStoredProceduresCount [
	^ (self evaluatedClassificationArray
			select: [ :array | array first = 'TriggerStoredProcedure' and: [ array fourth ] ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> correctlyAutomaticallyClassifiedTriggersCount [
	^ (self evaluatedClassificationArray
			select: [ :array | array first = 'Trigger' and: [ array fourth ] ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> correctlyAutomaticallyClassifiedViewsCount [
	^ (self evaluatedClassificationArray
			select: [ :array | array first = 'View' and: [ array fourth ] ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> correctlyClassiedEntitiesExceptTables [
	^ self evaluatedClassificationArray count: [ :a | a first ~= 'Table' and: [ a fourth ] ]
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> correctlyClassiedEntitiesPerType [
	^ (self evaluatedClassificationArray groupedBy: #first)
		collect: [ :arrays |
			{ arrays count: [ :a | a fourth ] . arrays count: [ :a | a fourth not ] } ]
]

{ #category : #accessing }
FmxSQLClassificationDataAnalysis >> directory [
	^ directory
]

{ #category : #accessing }
FmxSQLClassificationDataAnalysis >> directory: anObject [
	directory := anObject
]

{ #category : #accessing }
FmxSQLClassificationDataAnalysis >> evaluatedClassificationArray [
	^ self evaluatedClassificationFile readStreamDo: [ :stream |
		((NeoCSVReader on: stream)
			separator: $;;
			skipHeader;
			addField;
			addField;
			addIntegerField;
			addFieldConverter: [ :x | x trimmed = 'YES' ];
			addField;
			addIntegerField;
			upToEnd) collect: [ :array | (array allButLast: 2) , { array last } ] ]
]

{ #category : #accessing }
FmxSQLClassificationDataAnalysis >> evaluatedClassificationFile [
	^ self directory / 'evaluated_classification.csv'
]

{ #category : #accessing }
FmxSQLClassificationDataAnalysis >> featureGroupsArray [
	^ self featureGroupsFile readStreamDo: [ :stream |
		((NeoCSVReader on: stream)
			separator: $;;
			skipHeader;
			addIntegerField;
			addField;
			upToEnd) ]
]

{ #category : #accessing }
FmxSQLClassificationDataAnalysis >> featureGroupsFile [
	^ self directory / 'feature_groups.csv'
]

{ #category : #'as yet unclassified' }
FmxSQLClassificationDataAnalysis >> importConceptsInModel: aModel [
	self allEntitiesToFeatureGroup do: [ :array |
		(aModel detect: [ :e |
			(e className allButFirst: 'FmxSQL' size) = array first
				and: [ e name = array second and: [ e hasConcept not ] ] ]) concept: array last ]
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> incorrectlyAutomaticallyClassifiedStoredProceduresCount [
	^ (self evaluatedClassificationArray
			select: [ :array | array first = 'StoredProcedure' and: [ array fourth not ] ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> incorrectlyAutomaticallyClassifiedTriggerStoredProceduresCount [
	^ (self evaluatedClassificationArray
			select: [ :array | array first = 'TriggerStoredProcedure' and: [ array fourth not ] ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> incorrectlyAutomaticallyClassifiedTriggersCount [
	^ (self evaluatedClassificationArray
			select: [ :array | array first = 'Trigger' and: [ array fourth not ] ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> incorrectlyAutomaticallyClassifiedViewsCount [
	^ (self evaluatedClassificationArray
			select: [ :array | array first = 'View' and: [ array fourth not ] ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> incorrectlyClassiedEntitiesExceptTables [
	^ self evaluatedClassificationArray count: [ :a | a first ~= 'Table' and: [ a fourth not ] ] 
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> manuallyClassifiedStoredProceduresCount [
	^ (self classifiedEntitiesArray
			select: [ :array | array first = 'StoredProcedure' ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> manuallyClassifiedTriggerStoredProceduresCount [
	^ (self classifiedEntitiesArray
			select: [ :array | array first = 'TriggerStoredProcedure' ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> manuallyClassifiedTriggersCount [
	^ (self classifiedEntitiesArray
			select: [ :array | array first = 'Trigger' ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> manuallyClassifiedViewsCount [
	^ (self classifiedEntitiesArray
			select: [ :array | array first = 'View' ]) size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> storedProceduresPerCategory [
	^ ((self classifiedEntitiesArray , self evaluatedClassificationArray
		select: [ :array | array first = 'StoredProcedure' ])
		groupedBy: #last) collect: #size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> tablesPerCategory [
	^ ((self evaluatedClassificationArray
		select: [ :array | array first = 'Table' ])
		groupedBy: #last) collect: #size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> triggerStoredProceduresPerCategory [
	^ ((self classifiedEntitiesArray , self evaluatedClassificationArray
		select: [ :array | array first = 'TriggerStoredProcedure' ])
		groupedBy: #last) collect: #size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> triggersPerCategory [
	^ ((self classifiedEntitiesArray , self evaluatedClassificationArray
		select: [ :array | array first = 'Trigger' ])
		groupedBy: #last) collect: #size
]

{ #category : #accessing }
FmxSQLClassificationDataAnalysis >> triggersToBeClassifiedAfterArray [
	^ self triggersToBeClassifiedAfterFile readStreamDo: [ :stream |
		((NeoCSVReader on: stream)
			separator: $;;
			skipHeader;
			addField;
			addField;
			addField;
			addIntegerField;
			upToEnd) ]
]

{ #category : #accessing }
FmxSQLClassificationDataAnalysis >> triggersToBeClassifiedAfterFile [
	^ self directory / 'trigger-tobeclassified-after-filled.csv'
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> triggersToBeClassifiedAfterPerCategory [
	^ ((self triggersToBeClassifiedAfterArray
		select: [ :array | array first = 'Trigger' ])
		groupedBy: #last) collect: #size
]

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> viewsPerCategory [
	^ ((self classifiedEntitiesArray , self evaluatedClassificationArray
		select: [ :array | array first = 'View' ])
		groupedBy: #last) collect: #size
]
