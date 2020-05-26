"
Abstract analyzer class to compute something on a FamixNGSQL model.
"
Class {
	#name : #FmxSQLAnalyzer,
	#superclass : #Object,
	#instVars : [
		'mooseGroup'
	],
	#category : #FAMIXNGSQLAnalysis
}

{ #category : #analyzing }
FmxSQLAnalyzer class >> analyze: aMooseGroup [
	^ (self on: aMooseGroup)
		analyze;
		yourself
]

{ #category : #'instance creation' }
FmxSQLAnalyzer class >> on: aMooseGroup [
	^ self new
		mooseGroup: aMooseGroup;
		yourself
]

{ #category : #analyzing }
FmxSQLAnalyzer >> analyze [
	"Analyze the MooseModel containing FamixNGSQL entities to compute something to be defined in subclasses."
	self subclassResponsibility
]

{ #category : #accessing }
FmxSQLAnalyzer >> mooseGroup [
	^ mooseGroup
]

{ #category : #accessing }
FmxSQLAnalyzer >> mooseGroup: anObject [
	mooseGroup := anObject
]
