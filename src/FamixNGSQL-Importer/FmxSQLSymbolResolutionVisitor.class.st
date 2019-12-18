Class {
	#name : #FmxSQLSymbolResolutionVisitor,
	#superclass : #PSQLASTVisitor,
	#traits : 'SRSolverUserVisitor',
	#classTraits : 'SRSolverUserVisitor classTrait',
	#instVars : [
		'model',
		'function',
		'report',
		'solver',
		'errorReport',
		'view'
	],
	#category : 'FamixNGSQL-Importer-Visitor'
}

{ #category : #'instance creation' }
FmxSQLSymbolResolutionVisitor class >> model: aMooseModel function: aFunction [
	^ self new
		model: aMooseModel;
		function: aFunction;
		yourself
]

{ #category : #'instance creation' }
FmxSQLSymbolResolutionVisitor class >> model: aMooseModel function: aFmxSQLStoredProcedure errorReport: aPSQParsingReport [
	^ (self model: aMooseModel function: aFmxSQLStoredProcedure)
		errorReport: aPSQParsingReport;
		yourself
]

{ #category : #'instance creation' }
FmxSQLSymbolResolutionVisitor class >> model: aMooseModel view: aFmxSQLView [
	^ self new
		model: aMooseModel;
		view: aFmxSQLView;
		yourself
]

{ #category : #'instance creation' }
FmxSQLSymbolResolutionVisitor class >> model: aMooseModel view: aFmxSQLView errorReport: aPSQParsingReport [
	^ (self model: aMooseModel function: aFmxSQLView)
		errorReport: aPSQParsingReport;
		yourself
]

{ #category : #'entity creation' }
FmxSQLSymbolResolutionVisitor >> createClause: aClauseClass from: aPSQLASTClauseNode [
	^ (self createEntity: aClauseClass from: aPSQLASTClauseNode)
		query: self currentEntity;
		yourself
]

{ #category : #'entity creation' }
FmxSQLSymbolResolutionVisitor >> createEntity: anEntityClass [ 
	^ anEntityClass new
		mooseModel: self model;
		yourself
]

{ #category : #'entity creation' }
FmxSQLSymbolResolutionVisitor >> createEntity: anEntityClass from: aPSQLASTNode [
	| anchor |
	anchor := self createSourceAnchorFrom: aPSQLASTNode.
	^ (self createEntity: anEntityClass)
		sourceAnchor: anchor;
		yourself
]

{ #category : #'entity creation' }
FmxSQLSymbolResolutionVisitor >> createFmxSQLAliasNamed: anAlias [
	^ (self createEntity: FmxSQLColumnAlias)
		parentBehaviouralEntity: self currentEntity;
		name: anAlias;
		yourself.
]

{ #category : #'entity creation' }
FmxSQLSymbolResolutionVisitor >> createFmxSQLAliasNamed: aString forCurrentEntity: aFmxSQLEntity nodeForReference: aPSQLASTNode [
	| alias |
	alias := (self createEntity: aFmxSQLEntity aliasClass)
		parentBehaviouralEntity: self currentEntity;
		name: aString;
		yourself.
	self
		useCurrentEntity: alias
		during: [ self createReferenceTo: aFmxSQLEntity from: aPSQLASTNode ].
	^ alias
]

{ #category : #'entity creation' }
FmxSQLSymbolResolutionVisitor >> createFmxSQLColumnAliasNamed: aString forDerivedTable: aFmxSQLDerivedTable nodeForReference: aPSQLASTNode [
	| alias |
	alias := (self createEntity: FmxSQLColumnAlias)
		parentBehaviouralEntity: self currentEntity;
		name: aString;
		yourself.
	self
		useCurrentEntity: alias
		during: [ self createReferenceTo: aFmxSQLDerivedTable from: aPSQLASTNode ].
	^ alias
]

{ #category : #'entity creation' }
FmxSQLSymbolResolutionVisitor >> createQueryContainedByCurrentEntity: aClass from: anASTNode [
	| newQuery currentEntity |
	newQuery := self createEntity: aClass from: anASTNode.
	currentEntity := self currentEntity.
	currentEntity isQueryContainer
		ifTrue:
			[ "If current entity is a query container, we can directly set the entity as contained by it" newQuery container: currentEntity ]
		ifFalse: [ "Otherwise we need to create a reference to a DerivedTable"
			|derivedTable|
			derivedTable := (self createEntity: FmxSQLDerivedTable)
									query: newQuery;
									parentQuery: (self solver detect: [ :scope | scope entity isKindOf: FmxSQLCRUDQuery ]) entity;
									yourself.
			self createReferenceTo: derivedTable from: anASTNode
		 ].
	^ newQuery
]

{ #category : #'convenient linking' }
FmxSQLSymbolResolutionVisitor >> createReferenceTo: anEntity from: aPSQLASTNode [
	| anchor reference |
	anchor := self createSourceAnchorFrom: aPSQLASTNode.
	reference := (anEntity value createReferenceEntityFrom: self currentEntity)
		sourceAnchor: anchor;
		mooseModel: self model;
		yourself.
		
	reference isColumnReference
		ifTrue: [ reference isWildCardReference: aPSQLASTNode isWildCard ].
	^ reference
]

{ #category : #'entity creation' }
FmxSQLSymbolResolutionVisitor >> createSourceAnchorFrom: aPSQLASTNode [
	^ (self createEntity: FmxSQLEntitySourceAnchor)
		start: aPSQLASTNode startPosition;
		end: aPSQLASTNode endPosition;
		entity:
			(self view
				ifNil: [ self function
						ifNil: [ self
								error: 'A view or a function should be set for symbol resolution.' ] ]);
		yourself
]

{ #category : #accessing }
FmxSQLSymbolResolutionVisitor >> currentEntity: anEntity [
	^ self solver pushScope: (SREntityScope currentEntity: anEntity)
]

{ #category : #'entity creation' }
FmxSQLSymbolResolutionVisitor >> ensureNewOrOldLocalVariableWellSetFor: identifiers [
	|localVariable |
	self assert: (self isNewOrOldIdentifier: identifiers).
	self assert: (identifiers isLast or: [ identifiers next isLast ]).
	localVariable := identifiers identifier = 'new'
		ifTrue: [
			self function localVariables 
				detect: [ :l | l class = FmxSQLNewLocalVariable ]
				ifNone: [ 
					(self createEntity: FmxSQLNewLocalVariable)
						name: 'new';
						parentBehaviouralEntity: self function;
						yourself ] ]
		ifFalse: [
			self function localVariables 
				detect: [ :l | l class = FmxSQLOldLocalVariable ]
				ifNone: [ 
					(self createEntity: FmxSQLOldLocalVariable)
						name: 'old';
						parentBehaviouralEntity: self function;
						yourself ] ].
	
	identifiers isLast
		ifTrue: [ ^ self ].
	
	localVariable columns
		detect: [ :c | c name = identifiers next identifier ]
		ifNone: [
			(self createEntity: FmxSQLColumn)
				name: identifiers next identifier;
				columnsContainer: localVariable ]
]

{ #category : #accessing }
FmxSQLSymbolResolutionVisitor >> errorReport [
	errorReport ifNil: [ errorReport := SRParsingReport new ].
	^ errorReport
]

{ #category : #finding }
FmxSQLSymbolResolutionVisitor >> findStoredProcedureNamed: anIdentifier [
	"The next conditional branching is needed because of PostgreSQL treatement of identifiers.
	 If you define an identifier between "", it is case-sensitive, else it is not."
	anIdentifier indexOfFirstUppercaseCharacter > 0
		ifTrue: [ ^ (self model allWithType: FmxSQLStoredProcedure) detect: [ :aFunction | aFunction name = anIdentifier ] ]
		ifFalse: [ ^ (self model allWithType: FmxSQLStoredProcedure) detect: [ :aFunction | aFunction name asLowercase = anIdentifier ] ]
]

{ #category : #finding }
FmxSQLSymbolResolutionVisitor >> findTableNamed: anIdentifier [ 
	^ (self model allWithType: FmxSQLTable) detect: [ :table | table name = anIdentifier ]  .
]

{ #category : #finding }
FmxSQLSymbolResolutionVisitor >> findTableOrViewNamed: aString [
	^ [ self findTableNamed: aString ]
		on: NotFound
		do: [ self findViewNamed: aString ]
]

{ #category : #finding }
FmxSQLSymbolResolutionVisitor >> findTypeNamed: aName [
	^ [ self findTableOrViewNamed: aName ]
		on: NotFound
		do: [ (self model allWithType: FmxSQLType)
				detect: [ :aType | aType name = aName ]
				ifNone: [ (self createEntity: FmxSQLType) name: aName ] ]
]

{ #category : #finding }
FmxSQLSymbolResolutionVisitor >> findViewNamed: anIdentifier [
	^ (self model allWithType: FmxSQLView) detect: [ :table | table name = anIdentifier ]
]

{ #category : #accessing }
FmxSQLSymbolResolutionVisitor >> function [
	^ function
]

{ #category : #accessing }
FmxSQLSymbolResolutionVisitor >> function: anObject [
	function := anObject.
	self currentEntity: function
]

{ #category : #initialization }
FmxSQLSymbolResolutionVisitor >> initialiseSolver [
	solver := SRReferencesSolver new
]

{ #category : #testing }
FmxSQLSymbolResolutionVisitor >> isImplicitVariable: anIdentifier [
	^ #('found' 'others') includes: anIdentifier
]

{ #category : #testing }
FmxSQLSymbolResolutionVisitor >> isNewOrOldIdentifier: aPSQIdentifierWithNode [
	^ #('new' 'old') includes: aPSQIdentifierWithNode identifier
]

{ #category : #'convenient linking' }
FmxSQLSymbolResolutionVisitor >> linkReferencedEntities: aSRIdentifierWithNode [
	^ self linkReferencedEntities: aSRIdentifierWithNode withQualifiedReference: (self createEntity: FmxSQLNullQualifiedReference)
]

{ #category : #'convenient linking' }
FmxSQLSymbolResolutionVisitor >> linkReferencedEntities: aSRIdentifierWithNode withQualifiedReference: aQualifiedReference [
	|reference|
	reference := aQualifiedReference.
	aSRIdentifierWithNode entity
		ifNotNil: [ 
			reference := reference addReference: (self createReferenceTo: aSRIdentifierWithNode entity from: aSRIdentifierWithNode node) ].
	aSRIdentifierWithNode isLast
		ifFalse: [ self linkReferencedEntities: aSRIdentifierWithNode next withQualifiedReference: reference ]
]

{ #category : #accessing }
FmxSQLSymbolResolutionVisitor >> model [
	^ model
]

{ #category : #accessing }
FmxSQLSymbolResolutionVisitor >> model: anObject [
	model := anObject.
	self initialiseSolver.
	self
		pushEntitiesAsScope: (model allWithType: FmxSQLNamespace) , (model allWithType: FmxSQLTable) , (model allWithType: FmxSQLView)
]

{ #category : #resolution }
FmxSQLSymbolResolutionVisitor >> resolveAndLink: identifiers [ 
	self resolve: identifiers.
	self flag: #TODO. "Needs refactoring to remove duplication with #resolveAndLinkSilently:"
	identifiers isLast
		ifFalse: [ self linkReferencedEntities: identifiers. ^ self ].
	
	identifiers entity
		ifNotNil: [ 
			self createReferenceTo: identifiers entity from: identifiers node ].
]

{ #category : #resolution }
FmxSQLSymbolResolutionVisitor >> resolveAndLinkSilently: identifiers [ 
	self resolveSilently: identifiers.
	self flag: #TODO. "Needs refactoring to remove duplication with #resolveAndLink:"
	identifiers isLast
		ifFalse: [ self linkReferencedEntities: identifiers. ^ self ].
	
	identifiers entity
		ifNotNil: [ 
			self createReferenceTo: identifiers entity from: identifiers node ].
]

{ #category : #resolution }
FmxSQLSymbolResolutionVisitor >> resolveSilently: identifiers [
	self errorReport
		catch: SRReferencesInconsistencies , SRReferencesNotFound
		during: [ self resolve: identifiers ]
]

{ #category : #testing }
FmxSQLSymbolResolutionVisitor >> shouldRejectIdentifiers: aPSQIdentifierWithNode [
	^ #('true' 'false' 'array') includes: aPSQIdentifierWithNode identifier
]

{ #category : #accessing }
FmxSQLSymbolResolutionVisitor >> view [
	^ view
]

{ #category : #accessing }
FmxSQLSymbolResolutionVisitor >> view: anObject [
	view := anObject.
	self currentEntity: anObject
]

{ #category : #'visiting - convenience' }
FmxSQLSymbolResolutionVisitor >> visit: aNode [ 
	^ self visit: aNode thenDo: [:res | res ]
]

{ #category : #'visiting - convenience' }
FmxSQLSymbolResolutionVisitor >> visit: nilOrNode thenDo: aBlockClosure [
	^ nilOrNode ifNotNil: [ ^ aBlockClosure value: (nilOrNode acceptVisitor: self) ]
]

{ #category : #'visiting - convenience' }
FmxSQLSymbolResolutionVisitor >> visitAll: aCollection [
	^ self visitAll: aCollection thenDoForEach: [ :e |  ]
]

{ #category : #'visiting - convenience' }
FmxSQLSymbolResolutionVisitor >> visitAll: aCollection thenDoForEach: aBlockClosure [
	aCollection ifNotNil: [ aCollection do: [ :aNode | self visit: aNode thenDo: aBlockClosure ] ]
]

{ #category : #'visiting - convenience' }
FmxSQLSymbolResolutionVisitor >> visitExpression: anExpressionNode [
	self flag: #TODO. "Temporary. Quite sure to put that in the top of the context stack"
	^ self visit: anExpressionNode thenDo: [ :res | res ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQASTNull: aPSQLASTNull [ 
	^ aPSQLASTNull 
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTAggregateFunctionCall: aPSQLASTAggregateFunctionCall [
	self errorReport
		catch: NotFound
		during: [ self createReferenceTo: (self findStoredProcedureNamed: (self visit: aPSQLASTAggregateFunctionCall functionIdentifier)) from: aPSQLASTAggregateFunctionCall ].
	self visitAll: aPSQLASTAggregateFunctionCall expressions.
	self visit: aPSQLASTAggregateFunctionCall orderByClause
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTAliasDefinition: aPSQLASTAliasDefinition [
	|references referencesDiff visitResult referencesGroup alias|
	references := OrderedCollection new.
	self currentEntity isSelectClause
		ifTrue: [ references := (model allWithSubTypesOf: FmxSQLReference) select: [ :r | r from = self currentEntity ] ].
	visitResult := self visit: aPSQLASTAliasDefinition definition.
	alias := self visit: aPSQLASTAliasDefinition alias.
	
	visitResult "The definition is just a constant..."
		ifNil: [ ^ PSQLConstantToBeAliased alias: alias ].
		
	visitResult class = SREntityScope "The definition is a derived table..."
		ifTrue: [ |query derivedTable|
			query := visitResult entity query.
			derivedTable := (self createEntity: FmxSQLDerivedTable)
									query: query;
									parentQuery: (self solver peekScopeAtIndex: 3) entity;
									yourself.
			^ PSQLDerivedTableToBeAliasedByColumn alias: alias entity: derivedTable astNode: aPSQLASTAliasDefinition definition ].
	
	referencesDiff := ((model allWithSubTypesOf: FmxSQLReference) select: [ :r | r from = self currentEntity ]) \ references.
	referencesGroup := (self createEntity: FmxSQLReferencesGroup)
									sourceAnchor: (self createSourceAnchorFrom: aPSQLASTAliasDefinition definition);
									references: referencesDiff;
									yourself.
	^ PSQLEntityToBeAliased alias: alias entity: referencesGroup astNode: aPSQLASTAliasDefinition definition
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTAllClause: aPSQLASTAllClause [
	aPSQLASTAllClause childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTAlternativeSelectIntoQuery: aPSQLASTAlternativeSelectIntoQuery [
	^ self visitPSQLASTSelectQuery: aPSQLASTAlternativeSelectIntoQuery
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTArgument: aPSQLASTArgument [
	self flag: #TODO.	"Maybe we can do more with the parameter name in the linking"
	^ self visit: aPSQLASTArgument parameterValue
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTArrayConstructor: aPSQLASTArrayConstructor [
	aPSQLASTArrayConstructor childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTAttributeAccess: aPSQLASTAttributeAccess [
	| identifiers |
	identifiers := nil.
	self
		visit: aPSQLASTAttributeAccess attributeIdentifier
		thenDo: [ :identifier | identifiers := SRIdentifierWithNode identifier: identifier node: aPSQLASTAttributeAccess attributeIdentifier next: identifiers ].
	self
		visit: aPSQLASTAttributeAccess accessed
		thenDo: [ :identifier | identifiers := SRIdentifierWithNode identifier: identifier node: aPSQLASTAttributeAccess accessed next: identifiers ].

	"We check that the identifier should be ignored (for example true or false)"
	(self shouldRejectIdentifiers: identifiers)
		ifTrue: [ ^ nil ]. self flag: #TODO. "Nil should never be returned..."
	
	((self isNewOrOldIdentifier: identifiers) and: [ self function isTriggerStoredProcedure ])
		ifTrue: [ self ensureNewOrOldLocalVariableWellSetFor: identifiers ].
	
	[ self resolveAndLink: identifiers ]
		on: SRReferencesInconsistencies , SRReferencesNotFound
		do: [ :anError | 
			"new and old are implicit declared variables in stored procedures"
			(self isImplicitVariable: identifiers identifier)
				ifTrue: [ 
					(self createEntity: FmxSQLLocalVariable)
						name: identifiers identifier;
						storedProcedure: self function.
					self resolveAndLinkSilently: identifiers ]
				ifFalse: [ self errorReport addError: anError ] ].
	
	^ identifiers targetEntity
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTBinaryOperator: aPSQLASTBinaryOperator [
	aPSQLASTBinaryOperator childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTCaseExpression: aPSQLASTCaseExpression [
	aPSQLASTCaseExpression childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTCaseToExpression: aPSQLASTCaseToExpression [
	aPSQLASTCaseToExpression childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTCastExpression: aPSQLASTCastExpression [ 
	aPSQLASTCastExpression childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTColumnDefinition: aPSQLASTColumnDefinition [
	self flag: #TODO.	"ask for column definition representation in model"
	self visit: aPSQLASTColumnDefinition columnName.
	self visit: aPSQLASTColumnDefinition type
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTCompositeValue: aPSQLASTCompositeValue [
	aPSQLASTCompositeValue childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTConditionToExpression: aPSQLASTConditionToExpression [
	aPSQLASTConditionToExpression childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTConditionalExpression: aPSQLASTConditionalExpression [
	aPSQLASTConditionalExpression conditionsToExpressions
		do: [ :aConditionToExpresion | 
			self visitExpression: aConditionToExpresion condition.
			self visitExpression: aConditionToExpresion expression ].
	self visitExpression: aPSQLASTConditionalExpression elseExpression
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTConflictAction: aPSQLASTConflictAction [
	aPSQLASTConflictAction childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTCursorParameter: aPSQLASTCursorParameter [
	| parameter |
	parameter := self createEntity: FmxSQLCursorParameter from: aPSQLASTCursorParameter.
	parameter
		name: (self visit: aPSQLASTCursorParameter parameterName);
		type: (self findTypeNamed: (self visit: aPSQLASTCursorParameter type));
		cursor: self currentEntity.
	^ parameter
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTDefaultValue: aPSQLASTDefaultValue [
	aPSQLASTDefaultValue childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTDefaultValues: aPSQLASTDefaultValues [
	aPSQLASTDefaultValues childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTDeleteQuery: aPSQLASTDeleteQuery [
	| scopeManager |
	scopeManager := self solver createScopeManager.
	self
		useCurrentEntity: (self createQueryContainedByCurrentEntity: FmxSQLDeleteQuery from: aPSQLASTDeleteQuery)
		during: [ "First we create the from clause of the query"
			self
				visit: aPSQLASTDeleteQuery tableName
				thenDo: [ :tableName | "Here we create manually the FROM clause because in the AST we do not model the FROM clause of a DELETE query with a node. We directly store the identifier of the table." 
					| fromClause fromClauseScope |
					fromClause := self createEntity: FmxSQLFromClause from: aPSQLASTDeleteQuery tableName.
					fromClause query: self currentEntity.
					fromClauseScope := SREntityScope currentEntity: fromClause.
					scopeManager pushScope: fromClauseScope andDoAsCurrentEntity: [ self createReferenceTo: (self findTableOrViewNamed: tableName) from: aPSQLASTDeleteQuery tableName ].
					 ].
			self visit: aPSQLASTDeleteQuery withClause thenDo: [ :withClause | scopeManager pushScope: withClause ].
			self visit: aPSQLASTDeleteQuery usingList thenDo: [ :usingScope | scopeManager pushScope: usingScope ].
			self visit: aPSQLASTDeleteQuery whereClause.
			self visit: aPSQLASTDeleteQuery returningClause.
			scopeManager clear ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTDistinctClause: aPSQLASTDistinctClause [
	self flag: #TODO. "We do not have a distinct clause yet... Needs to be fixed in the MM."
	"aPSQLASTDistinctClause childrenDo: [:aChild | aChild acceptVisitor: self]"
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTExceptClause: aPSQLASTExceptClause [
	Halt now.
	aPSQLASTExceptClause childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTExceptionCase: aPSQLASTExceptionCase [
	self visit: aPSQLASTExceptionCase exception.
	self visitAll: aPSQLASTExceptionCase statements
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTExceptionHandler: aPSQLASTExceptionHandler [
	self visitAll: aPSQLASTExceptionHandler declarations.
	self visitAll: aPSQLASTExceptionHandler statements.
	self visitAll: aPSQLASTExceptionHandler exceptionCases
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTExtractFunctionCall: aPSQLASTExtractFunctionCall [
	^ self visit: aPSQLASTExtractFunctionCall parameter
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTFetchClause: aPSQLASTFetchClause [
	aPSQLASTFetchClause childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTForClause: aPSQLASTForClause [
	aPSQLASTForClause childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTFromClause: aPSQLASTFromClause [
	| fromScope |
	self
		useCurrentEntity: (self createClause: FmxSQLFromClause from: aPSQLASTFromClause)
		during: [ self visitAll: aPSQLASTFromClause items.
			fromScope := self solver topScope ].
	^ fromScope
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTFromClauseItemType1: aPSQLASTFromClauseItemType1 [
	| table |
	table := self findTableOrViewNamed: (self visit: aPSQLASTFromClauseItemType1 tableName).
	self visit: aPSQLASTFromClauseItemType1 alias thenDo: [ :alias |
		self solver defineAliasInCurrentScope: (self createFmxSQLAliasNamed: alias forCurrentEntity: table nodeForReference: aPSQLASTFromClauseItemType1 tableName) for: table ].
	self visitAll: aPSQLASTFromClauseItemType1 columnAliases thenDoForEach: [ :columnAlias | Halt now	"Alias not managed now" ].
	^ self createReferenceTo: table from: aPSQLASTFromClauseItemType1 tableName
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTFromClauseItemType2: aPSQLASTFromClauseItemType2 [
	| alias fmxAlias valueOrSelect derivedTable |
	alias := self visit: aPSQLASTFromClauseItemType2 alias.
	valueOrSelect := (self visit: aPSQLASTFromClauseItemType2 valuesOrSelect) entity query.
	derivedTable := (self createEntity: FmxSQLDerivedTable)
							query: valueOrSelect;
							parentQuery: (self solver peekScopeAtIndex: 2) entity;
							yourself.
	fmxAlias := self
		createFmxSQLAliasNamed: alias
		forCurrentEntity: derivedTable
		nodeForReference: aPSQLASTFromClauseItemType2 valuesOrSelect.
	self visitAll: aPSQLASTFromClauseItemType2 columnAliases thenDoForEach: [ :columnAliasName | 
		(self createEntity: FmxSQLColumnAlias)
			name: columnAliasName;
			columnsContainerAlias: fmxAlias ].
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTFromClauseItemType3: aPSQLASTFromClauseItemType3 [
	aPSQLASTFromClauseItemType3 childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTFromClauseItemType4: aPSQLASTFromClauseItemType4 [
	aPSQLASTFromClauseItemType4 childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTFromClauseItemType5: aPSQLASTFromClauseItemType5 [
	aPSQLASTFromClauseItemType5 childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTFromClauseItemType6: aPSQLASTFromClauseItemType6 [
	self visit: aPSQLASTFromClauseItemType6 leftFromItem.
	self visit: aPSQLASTFromClauseItemType6 rightFromItem.
	self visit: aPSQLASTFromClauseItemType6 joinCondition.
	self visit: aPSQLASTFromClauseItemType6 usingList.
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTFromClauseItemType7: aPSQLASTFromClauseItemType7 [
	aPSQLASTFromClauseItemType7 childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTFunctionCall: aPSQLASTFunctionCall [
	self createReferenceTo: (self findStoredProcedureNamed: (self visit: aPSQLASTFunctionCall functionIdentifier)) from: aPSQLASTFunctionCall.
	self visitAll: aPSQLASTFunctionCall argumentsList.
	Halt if: aPSQLASTFunctionCall argumentsDictionary notEmpty
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTGroupByClause: aPSQLASTGroupByClause [
	self
		useCurrentEntity: (self createClause: FmxSQLGroupByClause from: aPSQLASTGroupByClause)
		during: [ self visitAll: aPSQLASTGroupByClause expressions ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTHavingClause: aPSQLASTHavingClause [
	aPSQLASTHavingClause childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTIdentifier: aPSQLASTIdentifier [
	| identifier |
	identifier := aPSQLASTIdentifier identifier.
	^ (identifier first = $" and: identifier last = $")
		ifTrue: [ identifier withoutQuoting ]
		ifFalse: [ identifier asLowercase ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTInsertQuery: aPSQLASTInsertQuery [
	| insertQuery |
	insertQuery := self createQueryContainedByCurrentEntity: FmxSQLInsertQuery from: aPSQLASTInsertQuery.
	^ self
		useCurrentEntity: insertQuery
		during: [ self
				useCurrentEntity: (self createClause: FmxSQLIntoClause from: aPSQLASTInsertQuery tableName)
				during: [ self
						visit: aPSQLASTInsertQuery tableName
						thenDo: [ :visitResult | self createReferenceTo: (self findTableOrViewNamed: visitResult) from: aPSQLASTInsertQuery tableName ].
					"The into clause add the table scope but only for the columns visit"
					self visitAll: aPSQLASTInsertQuery columns ].
			self visit: aPSQLASTInsertQuery withClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTInsertQuery returningClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTInsertQuery onConflictClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTInsertQuery valuesClause.
			self visit: aPSQLASTInsertQuery alias thenDo: [ :visitResult | Halt now ] ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTIntersectClause: aPSQLASTIntersectClause [
	Halt now.
	aPSQLASTIntersectClause childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTIntoClause: aPSQLASTIntoClause [
	aPSQLASTIntoClause type ifNotNil: [ Halt now ].
	^ self visit: aPSQLASTIntoClause newTable
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTLimitClause: aPSQLASTLimitClause [
	self
		useCurrentEntity: (self createClause: FmxSQLLimitClause from: aPSQLASTLimitClause)
		during: [ self visit: aPSQLASTLimitClause limit ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTNumericConstant: aPSQLASTNumericConstant [
	(aPSQLASTNumericConstant content asNumber )
	"Do nothing, we ignore the content of the constant, just check that it is a number"
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTOffsetClause: aPSQLASTOffsetClause [
	aPSQLASTOffsetClause childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTOnConflictClause: aPSQLASTOnConflictClause [
	aPSQLASTOnConflictClause childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTOrderByClause: aPSQLASTOrderByClause [
	self
		useCurrentEntity: (self createClause: FmxSQLOrderByClause from: aPSQLASTOrderByClause)
		during: [ self visitAll: aPSQLASTOrderByClause items ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTOrderByClauseItem: aPSQLASTOrderByClauseItem [
	aPSQLASTOrderByClauseItem childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTParenthesedExpression: aPSQLASTParenthesedExpression [
	^ self visit: aPSQLASTParenthesedExpression expression
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTPostfixOperator: aPSQLASTPostfixOperator [
	aPSQLASTPostfixOperator childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTPrefixOperator: aPSQLASTPrefixOperator [
	aPSQLASTPrefixOperator childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTReturningClause: aPSQLASTReturningClause [
	aPSQLASTReturningClause childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTSelectIntoQuery: aPSQLASTSelectIntoQuery [
	|toReturn recordLocalVariable |
	toReturn := self visitPSQLASTSelectQuery: aPSQLASTSelectIntoQuery.
	recordLocalVariable := self visit: aPSQLASTSelectIntoQuery intoClause.
	recordLocalVariable class = FmxSQLRecordLocalVariable
		ifFalse: [ ^ toReturn ].
	recordLocalVariable
		queryBoundTo: toReturn entity query.
	^ toReturn
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTSelectQuery: aPSQLASTSelectQuery [
	| selectQuery scopeManager selectClauseScope |
	scopeManager := self solver createScopeManager.
	selectQuery := self createQueryContainedByCurrentEntity: FmxSQLSelectQuery from: aPSQLASTSelectQuery.
	"first we look at the from clause to resolve references"
	self
		useCurrentEntity: selectQuery
		during: [ self
				visit: aPSQLASTSelectQuery fromClause
				thenDo: [ :fromScope | 
					"I have to precise that the from clause scope is not the current entity anymore"
					scopeManager pushScope: fromScope ].
			self visit: aPSQLASTSelectQuery withClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTSelectQuery allOrDistinctClause thenDo: [ :visitResult | self flag: #TODO ].
			self
				useCurrentEntity:
					((self createEntity: FmxSQLSelectClause)
						query: selectQuery;
						yourself)
				during: [ |aliasesToBeDefined|
					aliasesToBeDefined := OrderedCollection new.
					selectClauseScope := self solver topScope.
					self visitAll: aPSQLASTSelectQuery columnsAndAliasesSelected thenDoForEach: [ :toBeAliasedOrOtherObject |
						(toBeAliasedOrOtherObject isKindOf: PSQLAliasToBeCreated)
							ifTrue: [ aliasesToBeDefined add: toBeAliasedOrOtherObject ]
							ifFalse: [ 
								(toBeAliasedOrOtherObject = self or: [ toBeAliasedOrOtherObject isKindOf: FmxSQLEntity ]) "If this is true, it just mean the visit needed to return nothing."
									ifFalse: [ Warning signal: ('{1} was encountered in #visitPSQLASTSelectQuery:, in the SELECT treatment' format: { toBeAliasedOrOtherObject className } ) ] ] ].
					aliasesToBeDefined do: [ :toBeAliasedOrOtherObject | toBeAliasedOrOtherObject beDefinedUsing: self ].
					scopeManager pushScope: selectClauseScope ].
			self visit: aPSQLASTSelectQuery whereClause.
			self visit: aPSQLASTSelectQuery groupByClause.
			self visit: aPSQLASTSelectQuery havingClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTSelectQuery windowClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTSelectQuery unionIntersectExceptClause.
			self visit: aPSQLASTSelectQuery orderByClause.
			self visit: aPSQLASTSelectQuery limitClause.
			self visit: aPSQLASTSelectQuery offsetClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTSelectQuery fetchClause thenDo: [ :visitResult | Halt now ].
			self visit: aPSQLASTSelectQuery forClause.
			scopeManager clear ].
	"Here we return the select clause scope to be used if it is in a using clause"
	^ selectClauseScope
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTSelectWhereClause: aPSQLASTSelectWhereClause [
	| whereClause |
	whereClause := self createEntity: FmxSQLWhereClause from: aPSQLASTSelectWhereClause.
	whereClause query: self currentEntity.
	self
		useCurrentEntity: whereClause
		during: [ self visit: aPSQLASTSelectWhereClause condition ].
	^ whereClause
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTSetClause: aPSQLASTSetClause [
	aPSQLASTSetClause childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTSetClauseItemType1: aPSQLASTSetClauseItemType1 [
	aPSQLASTSetClauseItemType1 childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTSetClauseItemType2: aPSQLASTSetClauseItemType2 [
	aPSQLASTSetClauseItemType2 childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTSetClauseItemType3: aPSQLASTSetClauseItemType3 [
	aPSQLASTSetClauseItemType3 childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTStringConstant: aPSQLASTStringConstant [
	"Ignoring constants for now".
	^ aPSQLASTStringConstant 
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTSubscript: aPSQLASTSubscript [
	self visit: aPSQLASTSubscript target.
	self visit: aPSQLASTSubscript subscriptExpression
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTTableAlias: aPSQLASTTableAlias [
	aPSQLASTTableAlias childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTUnionClause: aPSQLASTUnionClause [
	self
		useCurrentEntity: (self createClause: FmxSQLUnionClause from: aPSQLASTUnionClause)
		during: [ self visit: aPSQLASTUnionClause selectQuery ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTUpdateDeleteWhereClause: aPSQLASTUpdateDeleteWhereClause [
	| whereClause |
	whereClause := self createClause: FmxSQLWhereClause from: aPSQLASTUpdateDeleteWhereClause.
	self
		useCurrentEntity: whereClause
		during: [ self visit: aPSQLASTUpdateDeleteWhereClause condition.
			self visit: aPSQLASTUpdateDeleteWhereClause currentOfCursor ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTUpdateQuery: aPSQLASTUpdateQuery [
	| scopeManager |
	scopeManager := self solver createScopeManager.
	self
		useCurrentEntity: (self createQueryContainedByCurrentEntity: FmxSQLUpdateQuery from: aPSQLASTUpdateQuery)
		during: [ self
				visit: aPSQLASTUpdateQuery fromClause
				thenDo: [ :fromScope | 
					"I have to precise that the from clause scope is not the current entity anymore"
					scopeManager pushScope: fromScope ].
			self
				visit: aPSQLASTUpdateQuery tableName
				thenDo: [ :tableName | 
					|table|
					table := self findTableOrViewNamed: tableName.
					self currentEntity table: table.
					scopeManager pushScope: (SREntityScope currentEntity: table) ].
			self flag: #TODO;
				useCurrentEntity:
					((self createEntity: FmxSQLSetClause)
						query: self currentEntity;
						yourself)
				during: [ self visit: aPSQLASTUpdateQuery setClause ].
			self visit: aPSQLASTUpdateQuery whereClause.
			self visit: aPSQLASTUpdateQuery returningClause.
			#(#alias #areDescendantTablesIncluded #hasOnly).
			self flag: #TODO.	"manage thing in this table"
			scopeManager clear ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTUsingClause: aPSQLASTUsingClause [
	| usingScope |
	self
		useCurrentEntity: (self createClause: FmxSQLUsingClause from: aPSQLASTUsingClause)
		during: [ usingScope := self solver topScope.
			self visitAll: aPSQLASTUsingClause list ].
	^ usingScope
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTValuesClause: aPSQLASTValuesClause [
	self
		useCurrentEntity: (self createClause: FmxSQLValuesClause from: aPSQLASTValuesClause)
		during: [ self visit: aPSQLASTValuesClause values ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTValuesCommand: aPSQLASTValuesCommand [
	self visitAll: aPSQLASTValuesCommand values.
	^ PSQLASTValuesNullObject new
		mooseModel: model;
		yourself
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTWhenExpression: aPSQLASTWhenExpression [ 
	^ self visit: aPSQLASTWhenExpression expression
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTWildCard: aPSQLASTWildCard [
	"Here we will create a reference on each accessible entities at the current scope"

	(self solver peekScopeAtIndex: 2) reachableEntities
		do: [ :aReachableEntity | self createReferenceTo: aReachableEntity from: aPSQLASTWildCard ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLASTWithClause: aPSQLASTWithClause [
	self flag: #todo.
	aPSQLASTWithClause childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTAliasDeclaration: aPSQLPlpgSQLASTAliasDeclaration [
	aPSQLPlpgSQLASTAliasDeclaration childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTArrayLoop: aPSQLPlpgSQLASTArrayLoop [
	aPSQLPlpgSQLASTArrayLoop childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTAssignment: aPSQLPlpgSQLASTAssignment [
	self visit: aPSQLPlpgSQLASTAssignment toAssign.
	self flag: #TODO.	"aPSQLPlpgSQLASTAssignment target can be an expression of any kind. The problem is when the expression is only an Identifier because it is not yet referenced."
	self
		visit: aPSQLPlpgSQLASTAssignment target
		thenDo: [ :res | 
			res isString
				ifTrue: [ self resolveAndLinkSilently: (SRIdentifierWithNode identifier: res node: aPSQLPlpgSQLASTAssignment target) ] ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTBlock: aPSQLPlpgSQLASTBlock [
	self visit: aPSQLPlpgSQLASTBlock label thenDo: [ :res | Halt now ].
	self visitAll: aPSQLPlpgSQLASTBlock declarations.
	self visitAll: aPSQLPlpgSQLASTBlock statements
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTBlockLabel: aPSQLPlpgSQLASTBlockLabel [
	aPSQLPlpgSQLASTBlockLabel childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCasesToStatements: aPSQLPlpgSQLASTCasesToStatements [
	aPSQLPlpgSQLASTCasesToStatements childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTClassicDeclaration: aPSQLPlpgSQLASTClassicDeclaration [
	| variableClass variable type |
	type := self visit: aPSQLPlpgSQLASTClassicDeclaration type.
	variableClass := type name = 'record'
							ifTrue: [ FmxSQLRecordLocalVariable ]
							ifFalse: [ FmxSQLLocalVariable ].
	variable := self createEntity: variableClass from: aPSQLPlpgSQLASTClassicDeclaration identifier.
	variable type: type.
	variable parentBehaviouralEntity: self function.
	self visit: aPSQLPlpgSQLASTClassicDeclaration defaultExpression thenDo: [ :e | Halt now ].
	self
		visit: aPSQLPlpgSQLASTClassicDeclaration identifier
		thenDo: [ :name | variable name: name ].
	^ variable
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTConditionToStatements: aPSQLPlpgSQLASTConditionToStatements [
	aPSQLPlpgSQLASTConditionToStatements childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTContinue: aPSQLPlpgSQLASTContinue [
	aPSQLPlpgSQLASTContinue childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCopyTypeDeclaration: aPSQLPlpgSQLASTCopyTypeDeclaration [
	| variable |
	variable := self createEntity: FmxSQLLocalVariable from: aPSQLPlpgSQLASTCopyTypeDeclaration identifier.
	variable parentBehaviouralEntity: self function.
	self visit: aPSQLPlpgSQLASTCopyTypeDeclaration accessToCopyType thenDo: [ :accessed | variable type: accessed type ].
	self visit: aPSQLPlpgSQLASTCopyTypeDeclaration identifier thenDo: [ :name | variable name: name ].
	^ variable
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCursorClose: aPSQLPlpgSQLASTCursorClose [
	aPSQLPlpgSQLASTCursorClose childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCursorDeclaration: aPSQLPlpgSQLASTCursorDeclaration [
	| localVariable cursor |
	localVariable := self createEntity: FmxSQLLocalVariable from: aPSQLPlpgSQLASTCursorDeclaration identifier.
	self
		visit: aPSQLPlpgSQLASTCursorDeclaration identifier
		thenDo: [ :variableName | localVariable name: variableName ].
	localVariable type: (self findTypeNamed: 'refcursor').
	localVariable parentBehaviouralEntity: self currentEntity.
	cursor := self createEntity: FmxSQLCursor from: aPSQLPlpgSQLASTCursorDeclaration.
	cursor parentBehaviouralEntity: self currentEntity.
	self createReferenceTo: cursor from: aPSQLPlpgSQLASTCursorDeclaration.
	self
		useCurrentEntity: cursor
		during: [ self
				visitAll: aPSQLPlpgSQLASTCursorDeclaration arguments.
			self visit: aPSQLPlpgSQLASTCursorDeclaration selectQuery ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCursorDelete: aPSQLPlpgSQLASTCursorDelete [
	aPSQLPlpgSQLASTCursorDelete childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCursorFetch: aPSQLPlpgSQLASTCursorFetch [
	self visit: aPSQLPlpgSQLASTCursorFetch cursorIdentifier.
	self visitAll: aPSQLPlpgSQLASTCursorFetch targets
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCursorFetchDirection: aPSQLPlpgSQLASTCursorFetchDirection [
	aPSQLPlpgSQLASTCursorFetchDirection childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCursorMove: aPSQLPlpgSQLASTCursorMove [
	aPSQLPlpgSQLASTCursorMove childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCursorMoveDirection: aPSQLPlpgSQLASTCursorMoveDirection [
	aPSQLPlpgSQLASTCursorMoveDirection childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCursorOpen: aPSQLPlpgSQLASTCursorOpen [
	self visit: aPSQLPlpgSQLASTCursorOpen cursorIdentifier.
	self visitAll: aPSQLPlpgSQLASTCursorOpen arguments
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCursorOpenForQuery: aPSQLPlpgSQLASTCursorOpenForQuery [
	| cursor |
	self
		visit: aPSQLPlpgSQLASTCursorOpenForQuery cursorIdentifier
		thenDo: [ :cursVar | 
			self
				resolveAndLinkSilently:
					(SRIdentifierWithNode
						identifier: cursVar
						node: aPSQLPlpgSQLASTCursorOpenForQuery cursorIdentifier) ].
	cursor := self createEntity: FmxSQLCursor from: aPSQLPlpgSQLASTCursorOpenForQuery.
	self createReferenceTo: cursor from: aPSQLPlpgSQLASTCursorOpenForQuery.
	self
		useCurrentEntity: cursor
		during: [ self visit: aPSQLPlpgSQLASTCursorOpenForQuery selectQuery ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTCursorStatement: aPSQLPlpgSQLASTCursorStatement [
	aPSQLPlpgSQLASTCursorStatement childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTForLoop: aPSQLPlpgSQLASTForLoop [
	| counterIdentifier |
	counterIdentifier := PSQLASTIgnoredLocalVariableNullObject new
									name: (self visit: aPSQLPlpgSQLASTForLoop target);
									yourself.
	
	self visit: aPSQLPlpgSQLASTForLoop fromExpression.
	self visit: aPSQLPlpgSQLASTForLoop toExpression.
	
	self useCurrentEntity: counterIdentifier during: [ 
		self visitAll: aPSQLPlpgSQLASTForLoop statements ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTIf: aPSQLPlpgSQLASTIf [
	aPSQLPlpgSQLASTIf childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTLoop: aPSQLPlpgSQLASTLoop [
	self visitAll: aPSQLPlpgSQLASTLoop statements
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTPerform: aPSQLPlpgSQLASTPerform [ 
	self flag: #TODO.
	"Ignored for now"
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTPositionalParameter: aPSQLPlpgSQLASTPositionalParameter [
	aPSQLPlpgSQLASTPositionalParameter childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTQueryResultsLoop: aPSQLPlpgSQLASTQueryResultsLoop [
	aPSQLPlpgSQLASTQueryResultsLoop childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTRaiseStatement: aPSQLPlpgSQLASTRaiseStatement [
	aPSQLPlpgSQLASTRaiseStatement childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTRecordDeclaration: aPSQLPlpgSQLASTRecordDeclaration [
	aPSQLPlpgSQLASTRecordDeclaration childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTReturnStatement: aPSQLPlpgSQLASTReturnStatement [
	aPSQLPlpgSQLASTReturnStatement childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTRowTypeDeclaration: aPSQLPlpgSQLASTRowTypeDeclaration [
	^ FmxSQLLocalVariable new
		name: (aPSQLPlpgSQLASTRowTypeDeclaration identifier acceptVisitor: self);
		type: (self findTableOrViewNamed: (aPSQLPlpgSQLASTRowTypeDeclaration tableIdentifier acceptVisitor: self));
		storedProcedure: function;
		mooseModel: model;
		yourself
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTSearchedCase: aPSQLPlpgSQLASTSearchedCase [
	aPSQLPlpgSQLASTSearchedCase childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTSimpleCase: aPSQLPlpgSQLASTSimpleCase [
	aPSQLPlpgSQLASTSimpleCase childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTType: aPSQLPlpgSQLASTType [
	self flag: #TODO.	"consider size and dimensions"
	^ self visit: aPSQLPlpgSQLASTType identifier thenDo: [ :typeName | self findTypeNamed: typeName ]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLASTWhileLoop: aPSQLPlpgSQLASTWhileLoop [
	aPSQLPlpgSQLASTWhileLoop childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQLPlpgSQLCursorUpdate: aPSQLPlpgSQLCursorUpdate [
	aPSQLPlpgSQLCursorUpdate childrenDo: [:aChild | aChild acceptVisitor: self]
]

{ #category : #visiting }
FmxSQLSymbolResolutionVisitor >> visitPSQPlpgSQLASTExit: aPSQLPlpgSQLASTExit [
	^ self visit: aPSQLPlpgSQLASTExit booleanExpression thenDo: [ :res |  ]
]
