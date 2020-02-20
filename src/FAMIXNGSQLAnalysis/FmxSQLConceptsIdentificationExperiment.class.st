Class {
	#name : #FmxSQLConceptsIdentificationExperiment,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'FAMIXNGSQLAnalysis-ConceptsIdentification'
}

{ #category : #importing }
FmxSQLConceptsIdentificationExperiment >> importConceptsFromCSVFile: aFileReference [
	| tableNameToTag |
	self assert: aFileReference asFileReference isFile.
	tableNameToTag := aFileReference asFileReference
		readStreamDo: [ :readStream | 
			(NeoCSVReader on: readStream)
				addField;
				addIntegerField;
				upToEnd ].

	"we remove pg_class as it is a stub table."
	tableNameToTag := tableNameToTag
		reject: [ :array | array first = 'pg_class' ].

	"Tag each table in the model."
	tableNameToTag
		do: [ :array | 
			(model allTables detect: [ :t | t name = array first ]) privateState
				attributeAt: #concept
				put: array second ]
]

{ #category : #accessing }
FmxSQLConceptsIdentificationExperiment >> kernelConceptId [
	^ 0
]

{ #category : #accessing }
FmxSQLConceptsIdentificationExperiment >> kernelTables [
	^ self modelTables select: [ :t | t conceptId = self kernelConceptId ]
]

{ #category : #accessing }
FmxSQLConceptsIdentificationExperiment >> kernelTablesDependingOnNonKernelTable [
	^ self kernelTables
		select: [ :kernelTable |
			kernelTable foreignKeyConstraints anySatisfy: [ :any | any referencedColumnsTable conceptId ~= kernelTable conceptId ] ]
]

{ #category : #accessing }
FmxSQLConceptsIdentificationExperiment >> model [
	^ model
]

{ #category : #accessing }
FmxSQLConceptsIdentificationExperiment >> model: anObject [
	model := anObject
]

{ #category : #accessing }
FmxSQLConceptsIdentificationExperiment >> modelTables [
	^ self model allTables select: [ :t | t privateState attributes anySatisfy: [ :any | any key = #concept ] ].
]

{ #category : #accessing }
FmxSQLConceptsIdentificationExperiment >> modelViews [
	^ self model allViews reject: #isStub
]

{ #category : #visualizing }
FmxSQLConceptsIdentificationExperiment >> visualizeTables [
	FmxSQLConceptsIdentificationVisualisation new
		tables: self modelTables;
		open.
]

{ #category : #visualizing }
FmxSQLConceptsIdentificationExperiment >> visualizeTablesAndViews [
	FmxSQLConceptsIdentificationVisualisation new
		tables: self modelTables;
		views: self modelViews;
		open.
]
