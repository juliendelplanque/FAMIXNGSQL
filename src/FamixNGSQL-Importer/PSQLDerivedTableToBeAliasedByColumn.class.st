"
I model an alias to a derived table to be created in a SELECT clause.

It is possible to have alias to derived table in the SELECT clause if the derived table has a single column and a single row.
"
Class {
	#name : #PSQLDerivedTableToBeAliasedByColumn,
	#superclass : #PSQLEntityToBeAliased,
	#category : #'FamixNGSQL-Importer-Utilities'
}

{ #category : #defining }
PSQLDerivedTableToBeAliasedByColumn >> beDefinedUsing: aPSQLASTReflectiveVisitor [
	|fromClause|
	fromClause := (aPSQLASTReflectiveVisitor solver peekScopeAtIndex: 2) entity.
	self assert: fromClause class = FmxSQLFromClause.
	aPSQLASTReflectiveVisitor createFmxSQLColumnAliasNamed: self alias forDerivedTable: self entity nodeForReference: self astNode.
	(self aliasHasTheSameNameAsOneOfTheColumnsContainerIn: fromClause)
			ifTrue: [ ^ self ].
	
	aPSQLASTReflectiveVisitor defineAliasInCurrentScope: self alias for: self entity.
]
