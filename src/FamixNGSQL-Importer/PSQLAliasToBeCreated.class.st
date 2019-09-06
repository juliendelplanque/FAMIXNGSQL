"
I model an alias to be created in a SELECT clause.

I am used to let the symbol resolution visitor remember the aliases to be created after the SELECT clause has been entirely visited.
"
Class {
	#name : #PSQLAliasToBeCreated,
	#superclass : #Object,
	#instVars : [
		'alias'
	],
	#category : #'FamixNGSQL-Importer-Utilities'
}

{ #category : #'instance creation' }
PSQLAliasToBeCreated class >> alias: aString [
	^ self new
		alias: aString;
		yourself
]

{ #category : #accessing }
PSQLAliasToBeCreated >> alias [
	^ alias
]

{ #category : #accessing }
PSQLAliasToBeCreated >> alias: anObject [
	self assert: anObject isNotNil.
	self assert: anObject class ~= PSQLASTReflectiveASTVisitor.
	alias := anObject
]

{ #category : #testing }
PSQLAliasToBeCreated >> aliasHasTheSameNameAsOneOfTheColumnsContainerIn: fromClause [
	"The following test checks whether the alias to be defined has the same name as a columns container in the
	 FROM clause. If it does, we do not define the alias in the current scope because in PostgreSQL, the only
	 effect of the alias in this configuration is to provide the name of the column for the derived table."
	^ (fromClause reachableEntities
			anySatisfy: [ :any | any isColumnsContainer and: [ any name = self alias ] ])
]
