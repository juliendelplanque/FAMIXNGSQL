Class {
	#name : #FmxSQLClassificationDataAnalysis,
	#superclass : #Object,
	#instVars : [
		'directory'
	],
	#category : #'FAMIXNGSQLAnalysis-ConceptsIdentification'
}

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
FmxSQLClassificationDataAnalysis >> correctlyClassiedEntities [
	self shouldBeImplemented
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
