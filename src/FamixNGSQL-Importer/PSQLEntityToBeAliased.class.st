"
I model an alias to an entity to be created in a SELECT clause.
"
Class {
	#name : #PSQLEntityToBeAliased,
	#superclass : #PSQLAliasToBeCreated,
	#instVars : [
		'entity',
		'astNode'
	],
	#category : 'FamixNGSQL-Importer-Utilities'
}

{ #category : #'instance creation' }
PSQLEntityToBeAliased class >> alias: alias entity: anEntity [
	self deprecated: 'Should not be used without #astNode set. Please use #alias:entity:astNode: instead.'.
	^ self new
		alias: alias;
		entity: anEntity;
		yourself
]

{ #category : #'instance creation' }
PSQLEntityToBeAliased class >> alias: alias entity: anEntity astNode: aPSQLASTNode [
	^ self new
		alias: alias;
		entity: anEntity;
		astNode: aPSQLASTNode;
		yourself
]

{ #category : #accessing }
PSQLEntityToBeAliased >> astNode [
	^ astNode
]

{ #category : #accessing }
PSQLEntityToBeAliased >> astNode: anObject [
	astNode := anObject
]

{ #category : #defining }
PSQLEntityToBeAliased >> beDefinedUsing: aPSQLASTReflectiveVisitor [
	|fromClause|
	fromClause := (aPSQLASTReflectiveVisitor solver peekScopeAtIndex: 2) entity.
	self assert: fromClause isFromClause.
	aPSQLASTReflectiveVisitor createFmxSQLAliasNamed: self alias forCurrentEntity: self entity nodeForReference: self astNode.
	(self aliasHasTheSameNameAsOneOfTheColumnsContainerIn: fromClause)
			ifTrue: [ ^ self ].
	
	aPSQLASTReflectiveVisitor defineAliasInCurrentScope: self alias for: self entity
]

{ #category : #accessing }
PSQLEntityToBeAliased >> entity [
	^ entity
]

{ #category : #accessing }
PSQLEntityToBeAliased >> entity: anObject [
	self assert: anObject isNotNil.
	self assert: anObject class ~= FmxSQLSymbolResolutionVisitor.
	self assert: anObject class ~= SREntityScope.
	entity := anObject
]
