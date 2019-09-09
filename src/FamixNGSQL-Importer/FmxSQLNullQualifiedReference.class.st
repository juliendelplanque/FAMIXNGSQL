Class {
	#name : #FmxSQLNullQualifiedReference,
	#superclass : #Object,
	#instVars : [
		'mooseModel'
	],
	#category : #'FamixNGSQL-Importer-Visitor'
}

{ #category : #adding }
FmxSQLNullQualifiedReference >> addReference: aFmxSQLReference [
	| qualifiedReference |
	qualifiedReference := FmxSQLQualifiedReference new
									mooseModel: self mooseModel;
									yourself.
	aFmxSQLReference qualifiedReference: qualifiedReference.
	^ qualifiedReference
]

{ #category : #accessing }
FmxSQLNullQualifiedReference >> mooseModel [
	^ mooseModel
]

{ #category : #accessing }
FmxSQLNullQualifiedReference >> mooseModel: anObject [
	mooseModel := anObject
]
