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
	FmxSQLEntitySourceAnchor new
		mooseModel: self mooseModel;
		entity: qualifiedReference references anyOne sourceAnchor entity;
		start: qualifiedReference references first sourceAnchor start;
		end: qualifiedReference references last sourceAnchor end;
		element: qualifiedReference;
		yourself.
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
