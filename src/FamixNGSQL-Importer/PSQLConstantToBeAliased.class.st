"
I model an alias to a constant to be created in a SELECT clause.
"
Class {
	#name : #PSQLConstantToBeAliased,
	#superclass : #PSQLAliasToBeCreated,
	#category : 'FamixNGSQL-Importer-Utilities'
}

{ #category : #defining }
PSQLConstantToBeAliased >> beDefinedUsing: aPSQLASTReflectiveVisitor [
	|fromClause aliasEntity |
	fromClause := (aPSQLASTReflectiveVisitor solver peekScopeAtIndex: 2) entity.
	self assert: fromClause class = FmxSQLFromClause.
	(self aliasHasTheSameNameAsOneOfTheColumnsContainerIn: fromClause)
			ifTrue: [ ^ self ].
	
	aliasEntity := aPSQLASTReflectiveVisitor createFmxSQLAliasNamed: self alias.
	aPSQLASTReflectiveVisitor defineAliasInCurrentScope: self alias for: aliasEntity.
]
