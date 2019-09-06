"
I am an implementation of the null object design patter.

I am used during symbol resolution.
"
Class {
	#name : #PSQLASTValuesNullObject,
	#superclass : #Object,
	#instVars : [
		'mooseModel'
	],
	#category : #'FamixNGSQL-Importer-Utilities'
}

{ #category : #'null pattern' }
PSQLASTValuesNullObject >> createReferenceEntityFrom: aFmxSQLEntity [
	"We do nothing on purpose this is a null object design pattern implementation."
	
]

{ #category : #'null pattern' }
PSQLASTValuesNullObject >> entity [
	"Used in #visitPSQLASTFromClauseItemType2: method of the importer."
	^ self
]

{ #category : #'null pattern' }
PSQLASTValuesNullObject >> mooseModel [
	^ mooseModel
]

{ #category : #'null pattern' }
PSQLASTValuesNullObject >> mooseModel: aMooseModel [ 
	mooseModel := aMooseModel
]

{ #category : #'null pattern' }
PSQLASTValuesNullObject >> query [
	"Used in #visitPSQLASTFromClauseItemType2: method of the importer."
	^ FmxSQLValuesQuery new
		mooseModel: self mooseModel;
		yourself
]
