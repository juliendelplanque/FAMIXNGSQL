"
I am an implementation of the null object design patter.

I am used during symbol resolution for local variables that are not considered.

An example of such variable is for loop variable.
"
Class {
	#name : #PSQLASTIgnoredLocalVariableNullObject,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'FamixNGSQL-Importer-Utilities'
}

{ #category : #'null pattern' }
PSQLASTIgnoredLocalVariableNullObject >> createReferenceEntityFrom: aFmxSQLEntity [
	"We do nothing on purpose this is a null object design pattern implementation."
	
]

{ #category : #testing }
PSQLASTIgnoredLocalVariableNullObject >> isColumnReference [
	^ false
]

{ #category : #'null pattern' }
PSQLASTIgnoredLocalVariableNullObject >> mooseModel: aMooseModel [ 
]

{ #category : #accessing }
PSQLASTIgnoredLocalVariableNullObject >> name [
	^ name
]

{ #category : #accessing }
PSQLASTIgnoredLocalVariableNullObject >> name: anObject [
	name := anObject
]

{ #category : #'null pattern' }
PSQLASTIgnoredLocalVariableNullObject >> reachableEntities [
	^ { self }
]

{ #category : #'null pattern' }
PSQLASTIgnoredLocalVariableNullObject >> sourceAnchor: aFmxSQLEntitySourceAnchor [ 
	aFmxSQLEntitySourceAnchor mooseModel
		remove: aFmxSQLEntitySourceAnchor
]
