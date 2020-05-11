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

{ #category : #statistics }
FmxSQLClassificationDataAnalysis >> incorrectlyClassiedEntitiesExceptTables [
	^ self evaluatedClassificationArray count: [ :a | a first ~= 'Table' and: [ a fourth not ] ] 
]
