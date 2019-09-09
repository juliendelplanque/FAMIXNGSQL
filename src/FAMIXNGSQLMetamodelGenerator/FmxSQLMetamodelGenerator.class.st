Class {
	#name : #FmxSQLMetamodelGenerator,
	#superclass : #FmxSQLStructuralMetamodelGenerator,
	#instVars : [
		'crudQuery',
		'view',
		'storedProcedure',
		'triggerStoredProcedure',
		'trigger',
		'selectQuery',
		'insertQuery',
		'updateQuery',
		'deleteQuery',
		'parameter',
		'localVariable',
		'storedProcedureCall',
		'derivedTable',
		'viewReference',
		'derivedTableReference',
		'behaviouralEntity',
		'localVariableAccess',
		'clause',
		'withClause',
		'whereClause',
		'returningClause',
		'onConflictClause',
		'setClause',
		'fromClause',
		'selectClause',
		'groupByClause',
		'havingClause',
		'orderByClause',
		'joinClause',
		'unionClause',
		'intersectClause',
		'exceptClause',
		'valuesClause',
		'parameterAccess',
		'usingClause',
		'intoClause',
		'limitClause',
		'cursor',
		'cursorParameter',
		'cursorParameterAccess',
		'cursorReference',
		'alias',
		'aliasAccess',
		'tWithDerivedTableReference',
		'tWithViewReference',
		'tWithAlias',
		'tWithCursor',
		'tWithCursorReference',
		'referencesGroup',
		'referencesGroupReference',
		'tWithReferencesGroupReference',
		'tReferencesGroupReference',
		'newLocalVariable',
		'oldLocalVariable',
		'columnAlias',
		'columnAliasAccess',
		'columnsContainerAlias',
		'columnsContainerAliasAccess',
		'valuesQuery',
		'foreignTable',
		'recordLocalVariable',
		'entitySourceAnchor',
		'tWithEntitySourceAnchor',
		'tDefiningDerivedTables'
	],
	#category : 'FAMIXNGSQLMetamodelGenerator'
}

{ #category : #'meta-model regeneration' }
FmxSQLMetamodelGenerator class >> generate [
	"This method is just there to make regeneration of the MM easy."
	<script>
	[ super generate ] on: Warning do: [ :warning |
		warning logCr.
		warning resume ]
]

{ #category : #accessing }
FmxSQLMetamodelGenerator class >> packageName [
	^ 'FamixNGSQL'
]

{ #category : #accessing }
FmxSQLMetamodelGenerator class >> prefix [
	^ 'FmxSQL'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> aliasAccessComment [
	^ 'I am an access to an alias.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> aliasComment [
	^ 'I am an Alias'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> clauseComment [
	^ 'I am an abstract clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> columnAliasComment [
	^ 'I am an alias for a column.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> columnsContainerAliasComment [
	^ 'I am an alias for a table. Eventually I also contain alias to columns.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> conflictClauseComment [
	^ 'I am a on conflict clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> crudQueryComment [
	^ 'I am an abstract superclass for Create Read Update Delete (CRUD) queries.

The Create query is the INSERT query in SQL.

The Read query is the SELECT query in SQL.

The Update query is the UPDATE query in SQL.

The Delete query is the DELETE query in SQL.

My subclasses represent these four queries.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> cursorComment [
	^ 'I am a cursor, a local iterator that can have parameters'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> cursorParameterAccessComment [
	^ 'I am an access to a cursor parameter.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> cursorReferenceComment [
	^ 'I am a reference to a cursor'
]

{ #category : #'definition - behavioural' }
FmxSQLMetamodelGenerator >> defineBehaviouralEntities [
	"Abstract entities."

	"Concrete behavioural entities."
	"Concrete reference entities."
	behaviouralEntity := builder newTraitNamed: #BehaviouralEntity.
	view := builder newClassNamed: #View comment: self viewComment.
	view withTesting.
	derivedTable := builder
		newClassNamed: #DerivedTable
		comment: self derivedTableComment.
	crudQuery := builder
		newClassNamed: #CRUDQuery
		comment: self crudQueryComment.
	storedProcedure := builder
		newClassNamed: #StoredProcedure
		comment: self storedProcedureComment.
	storedProcedure withTesting.
	triggerStoredProcedure := builder
		newClassNamed: #TriggerStoredProcedure
		comment: self triggerStoredProcedureComment.
	trigger := builder
		newClassNamed: #Trigger
		comment: self triggerComment.
	selectQuery := builder
		newClassNamed: #SelectQuery
		comment: self selectQueryComment.
	insertQuery := builder
		newClassNamed: #InsertQuery
		comment: self insertQueryComment.
	updateQuery := builder
		newClassNamed: #UpdateQuery
		comment: self updateQueryComment.
	deleteQuery := builder
		newClassNamed: #DeleteQuery
		comment: self deleteQueryComment.
	valuesQuery := builder
		newClassNamed: #ValuesQuery
		comment: self valuesQueryComment.
	parameter := builder
		newClassNamed: #Parameter
		comment: self parameterComment.
	localVariable := builder
		newClassNamed: #LocalVariable
		comment: self localVariableComment.
	recordLocalVariable := builder
		newClassNamed: #RecordLocalVariable
		comment: self recordLocalVariableComment.
	newLocalVariable := builder
		newClassNamed: #NewLocalVariable
		comment: self newLocalVariableComment.
	oldLocalVariable := builder
		newClassNamed: #OldLocalVariable
		comment: self oldLocalVariableComment.
	cursor := builder newClassNamed: #Cursor comment: self cursorComment.
	cursorParameter := builder
		newClassNamed: #CursorParameter
		comment: 'I am a cursor parameter'.
	alias := builder newClassNamed: #Alias comment: self aliasComment.
	alias withTesting.
	columnsContainerAlias := builder
		newClassNamed: #ColumnsContainerAlias
		comment: self columnsContainerAliasComment.
	columnAlias := builder
		newClassNamed: #ColumnAlias
		comment: self columnAliasComment.
	self defineReferences.
	foreignTable := builder
		newClassNamed: #ForeignTable
		comment: self foreignTableComment.
	entitySourceAnchor := builder
		newClassNamed: #EntitySourceAnchor
		comment: self entitySourceAnchorComment.
	entitySourceAnchor withTesting
]

{ #category : #'definition - behavioural' }
FmxSQLMetamodelGenerator >> defineBehaviouralEntitiesProperties [
	trigger
		property: #firingAction type: #String;
		property: #when type: #String.
		
	entitySourceAnchor
		property: #start type: #Number;
		property: #end type: #Number.
		
	columnReference
		property: #isCertain type: #Boolean
]

{ #category : #'definition - behavioural' }
FmxSQLMetamodelGenerator >> defineBehaviouralEntitiesRelations [
	"A CheckConstraint can call StoredProcedures"
	(checkConstraint property: #storedProceduresCalled)
		*-*
	(storedProcedure property: #checkConstraintsCalling).
	
	"A View is defined as a SelectQuery."
	((view property: #query)
		<>-
	(selectQuery property: #viewDefining)) withoutPrimaryContainer.
	
	"A DerivedTable is defined as a CRUD query."
	((derivedTable property: #query)
		<>-
	(crudQuery property: #derivedTableDefining)) withoutPrimaryContainer.
	
	"A SelectQuery can define multiple derived tables."
	(tDefiningDerivedTables property: #derivedTablesDefined)
		<>-*
	(derivedTable property: #parentQuery).
	
	"A StoredProcedure has a return AbstractType."
	(storedProcedure property: #returnType)
		*-
	(tAbstractType property: #storedProceduresReturning).
	
	"A LocalVariable has an AbstractType."
	(localVariable property: #type)
		*-
	(tAbstractType property: #localVariables).
	
	"A Parameter has an AbstractType."
	(parameter property: #type)
		*-
	(tAbstractType property: #parameters).
	
	"A Cursor Parameter has an AbstractType."
	(cursorParameter property: #type)
		*-
	(tAbstractType property: #cursorParameters).
	
	"A stored procedure used by a trigger can reference Columns."
	(triggerStoredProcedure property: #columnsReferenced)
		<>-*
	(columnReference property: #triggerStoredProceduresReferencing).
	
	"The generalized trigger is now defined as always referencing a TriggerStoredProcedure.
	For DBMS where the trigger code is directly defined in the trigger, a virtual TriggerStoredProcedure
	is created to hold its source code."
	(trigger property: #storedProcedure)
		*-
	(triggerStoredProcedure property: #triggers).
	
	"A Trigger is contained in a Table. This is composition because, if the Table is removed,
	 the Trigger should be as well because it makes no sense to have a a trigger reacting to
	events of a non-existing table."
	(table property: #triggers)
		<>-*
	(trigger property: #table).
	
	"A group of references hold references."
	(referencesGroup property: #references)
		<>-* (reference property: #belongsToGroup).
	
	(recordLocalVariable property: #queryBoundTo)
		*- (selectQuery property: #recordLocalVariables).
		
	(columnsContainerAlias property: #columnAliases)
		-* (columnAlias property: #columnsContainerAlias).
]

{ #category : #'definition - behavioural' }
FmxSQLMetamodelGenerator >> defineBehaviouralHierarchy [
	"Abstract entities inheritance relations."
	behaviouralEntity --|> tWithEntitySourceAnchor.
	crudQuery --|> entity.
	crudQuery --|> #TWithSourceAnchor.
	crudQuery --|> #TEntityMetaLevelDependency.
	crudQuery --|> #TDependencyQueries.
	"Concrete structural entities inheritance relations."
	checkConstraint --|> constraint.
	checkConstraint --|> #TWithImmediateSource.
	"Concrete behavioural entities inheritance relations."
	view --|> behaviouralEntity.
	view --|> tAbstractType.
	view --|> tColumnsContainer.
	view --|> tQueryContainer.
	view --|> #TNamespaceEntity.
	view --|> #TWithImmediateSource.
	view --|> namedEntity.
	
	derivedTable --|> namedEntity.
	derivedTable --|> behaviouralEntity.
	derivedTable --|> tColumnsContainer.
	derivedTable --|> tQueryContainer.
	
	storedProcedure --|> behaviouralEntity.
	storedProcedure --|> tQueryContainer.
	storedProcedure --|> namedEntity.
	storedProcedure--|> #TNamespaceEntity.
	storedProcedure --|> #TWithReferences.
	storedProcedure --|> #TInvocable.
	storedProcedure --|> #TWithInvocations.
	storedProcedure --|> #TWithParameters.
	storedProcedure --|> #TWithLocalVariables.
	storedProcedure --|> #TWithAccesses.
	storedProcedure --|> tWithTableReference.
	storedProcedure --|> tWithAlias.
	storedProcedure --|> tWithCursor.
	storedProcedure --|> tWithCursorReference.
	storedProcedure --|> tWithColumnReference. "For COPY TYPE feature of Postgres."
	storedProcedure --|> #TWithImmediateSource.
	
	triggerStoredProcedure --|> storedProcedure.
	
	trigger --|> namedEntity.
	trigger --|> behaviouralEntity.
	trigger --|> #TNamespaceEntity.
	
	selectQuery --|> crudQuery.
	selectQuery --|> tDefiningDerivedTables.
	insertQuery --|> crudQuery.
	insertQuery --|> tDefiningDerivedTables.
	updateQuery --|> crudQuery.
	updateQuery --|> tDefiningDerivedTables.
	deleteQuery --|> crudQuery.
	deleteQuery --|> tDefiningDerivedTables.
	valuesQuery --|> crudQuery.
	
	parameter --|> namedEntity.
	parameter --|> #TParameter.
	parameter --|> #TAccessible.
	
	localVariable --|> namedEntity.
	localVariable --|> #TLocalVariable.
	localVariable --|> #TAccessible.
	
	recordLocalVariable --|> localVariable.
	recordLocalVariable --|> tColumnsContainer.
	
	newLocalVariable --|> localVariable.
	newLocalVariable --|> tColumnsContainer.
	
	oldLocalVariable --|> localVariable.
	oldLocalVariable --|> tColumnsContainer.
	
	cursorParameter --|> namedEntity.
	cursorParameter --|> #TParameter.
	cursorParameter --|> #TAccessible.
	
	cursor --|> namedEntity.
	cursor --|> behaviouralEntity.
	cursor --|> tQueryContainer.
	cursor --|> #TWithParameters.
	
	alias --|> namedEntity.
	alias --|> #TAccessible.
	"Needed for both column and columns container alias because it is possible
	 to define the value of a column from the result of a query."
	alias --|> tWithDerivedTableReference.
	
	columnsContainerAlias --|> alias.
	columnsContainerAlias --|> tWithTableReference.
	columnsContainerAlias --|> tWithViewReference.
	
	columnAlias --|> alias.
	columnAlias --|> tWithColumnReference.
	columnAlias --|> tWithReferencesGroupReference.
	columnAlias --|> tColumn.
	
	referencesGroup --|> entity.
	referencesGroup --|> #TWithSourceAnchor.
	referencesGroup --|> #TEntityMetaLevelDependency.
	referencesGroup --|> #TDependencyQueries.
	
	foreignTable --|> table.
	
	entitySourceAnchor --|> entity.
	entitySourceAnchor --|> #TSourceAnchor
]

{ #category : #'definition - behavioural' }
FmxSQLMetamodelGenerator >> defineBehaviouralReferenceEntities [
	"A view reference references a view."
	(viewReference property: #view) target
		*- (view property: #references).

	"A derived table reference references a derived table."
	(derivedTableReference property: #derivedTable) target
		*- (derivedTable property: #references).
		
	"A stored procedure call can contain other references (in its arguments)."
	((storedProcedureCall property: #arguments)
		<>-* (reference property: #storedProcedureContainer)) withoutPrimaryContainer.

	"A Local variable access must point a local variable."
	(localVariableAccess property: #localVariable) target
		*- (localVariable property: #accesses).

	"A query contains multiple clauses"
	(crudQuery property: #clauses)
		<>-* (clause property: #query).

	"A QueryContainer contains multiple queries"
	(tQueryContainer property: #queries)
		<>-* (crudQuery property: #container).

	"An update query target a table"
	(table property: #updateQueries)
		-* (updateQuery property: #table).
		
	"A cursor reference references a cursor."
	(cursorReference property: #cursor) target
		*- (cursor property: #references).
]

{ #category : #'definition - behavioural' }
FmxSQLMetamodelGenerator >> defineBehaviouralReferencesHierarchy [
	derivedTableReference --|> reference.
	viewReference --|> reference.
	parameterAccess --|> reference.
	parameterAccess --|> #TAccess.
	cursorParameterAccess --|> reference.
	cursorParameterAccess --|> #TAccess.
	storedProcedureCall --|> reference.
	storedProcedureCall --|> #TInvocation.
	localVariableAccess --|> reference.
	localVariableAccess --|> #TAccess.
	cursorReference --|> reference.
	aliasAccess --|> reference.
	aliasAccess --|> #TAccess.
	columnsContainerAliasAccess --|> reference.
	columnsContainerAliasAccess --|> #TAccess.
	columnAliasAccess --|> reference.
	columnAliasAccess --|> #TAccess.
	referencesGroupReference --|> reference.
	referencesGroupReference --|> tReferencesGroupReference.
	referencesGroupReference  --|> #TEntityMetaLevelDependency.
	referencesGroupReference --|> #TDependencyQueries.
]

{ #category : #'definition - behavioural' }
FmxSQLMetamodelGenerator >> defineBehaviouralTraits [
	tWithDerivedTableReference := builder
		newTraitNamed: #TWithDerivedTableReference.
	tWithViewReference := builder newTraitNamed: #TWithViewReference.
	tWithAlias := builder newTraitNamed: #TWithAlias.
	tWithCursor := builder newTraitNamed: #TWithCursor.
	tWithCursorReference := builder newTraitNamed: #TWithCursorReference.
	tReferencesGroupReference := builder
		newTraitNamed: #TReferencesGroupReference.
	tWithReferencesGroupReference := builder
		newTraitNamed: #TWithReferencesGroupReference.
	tWithEntitySourceAnchor := builder
		newTraitNamed: #TWithEntitySourceAnchor.
	tDefiningDerivedTables := builder
		newTraitNamed: #TDefiningDerivedTables
]

{ #category : #'definition - behavioural' }
FmxSQLMetamodelGenerator >> defineBehaviouralTraitsRelations [
	(tWithDerivedTableReference property: #outgoingDerivedTableReferences)
		-* (derivedTableReference property: #source) source.
	(tWithViewReference property: #outgoingViewReferences)
		-* (viewReference property: #source) source.
	(tWithCursorReference property: #outgoingCursorReferences)
		-* (cursorReference property: #source) source.
	((tWithAlias property: #aliases)
		<>-* (alias property: #parentBehaviouralEntity))
		withoutPrimaryContainer.
	(tWithCursor property: #cursors)
		<>-* (cursor property: #parentBehaviouralEntity).
	(tWithReferencesGroupReference
		property: #outgoingReferencesGroupReferences)
		<>-* (tReferencesGroupReference property: #source).
	(tReferencesGroupReference property: #referencesGroup)
		*- (referencesGroup property: #incomingReferencesGroupReference).
	(entitySourceAnchor property: #entity)
		*- (tWithEntitySourceAnchor property: #anchorsOnIntervalsOfCode)
]

{ #category : #definition }
FmxSQLMetamodelGenerator >> defineClasses [
	super defineClasses.
	self
		defineBehaviouralEntities;
		defineClausesEntities;
		defineClausesHierarchy
]

{ #category : #'definition - behavioural' }
FmxSQLMetamodelGenerator >> defineClausesEntities [
	"Clause entities."

	clause := builder newClassNamed: #Clause comment: self clauseComment.
	withClause := builder
		newClassNamed: #WithClause
		comment: self withClauseComment.
	whereClause := builder
		newClassNamed: #WhereClause
		comment: self whereClauseComment.
	whereClause withTesting.
	returningClause := builder
		newClassNamed: #ReturningClause
		comment: self returningClauseComment.
	onConflictClause := builder
		newClassNamed: #OnConflictClause
		comment: self conflictClauseComment.
	setClause := builder
		newClassNamed: #SetClause
		comment: self setClauseComment.
	fromClause := builder
		newClassNamed: #FromClause
		comment: self fromClauseComment.
	selectClause := builder
		newClassNamed: #SelectClause
		comment: self selectClauseComment.
	selectClause withTesting.
	groupByClause := builder
		newClassNamed: #GroupByClause
		comment: self groupByClauseComment.
	havingClause := builder
		newClassNamed: #HavingClause
		comment: self havingClauseComment.
	orderByClause := builder
		newClassNamed: #OrderByClause
		comment: self orderByClauseComment.
	joinClause := builder
		newClassNamed: #JoinClause
		comment: self joinClauseComment.
	joinClause withTesting.
	unionClause := builder
		newClassNamed: #UnionClause
		comment: self unionClauseComment.
	intersectClause := builder
		newClassNamed: #IntersectClause
		comment: self intersectClauseComment.
	exceptClause := builder
		newClassNamed: #ExceptClause
		comment: self exceptClauseComment.
	valuesClause := builder
		newClassNamed: #ValuesClause
		comment: self valuesClauseComment.
	usingClause := builder
		newClassNamed: #UsingClause
		comment: self usingClauseComment.
	intoClause := builder
		newClassNamed: #IntoClause
		comment: self intoClauseComment.
	limitClause := builder
		newClassNamed: #LimitClause
		comment: self limitClauseComment
]

{ #category : #'definition - behavioural' }
FmxSQLMetamodelGenerator >> defineClausesHierarchy [
	"Defining all kinds of clauses"
	clause --|> entity.
	clause --|> tWithAlias.
	clause --|> #TWithSourceAnchor.
	clause --|> #TEntityMetaLevelDependency.
	clause --|> #TDependencyQueries.
	
	fromClause --|> clause.
	fromClause --|> tWithTableReference.
	fromClause --|> tWithViewReference. "For view.column ref."
	fromClause --|> tWithDerivedTableReference.
	fromClause --|> tWithColumnReference. "Because of join clause"
	fromClause --|> tWithReferencesGroupReference.
	fromClause --|> #TWithAccesses. "Because of join clause"
	fromClause --|> #TWithInvocations. "Because of join clause"
	
	whereClause --|> clause.
	whereClause --|> tWithColumnReference.
	whereClause --|> #TWithAccesses.
	whereClause --|> #TWithInvocations.
	whereClause --|> tWithTableReference. "For table.column ref."
	whereClause --|> tWithViewReference. "For view.column ref."
	whereClause --|> tWithDerivedTableReference.
	whereClause --|> tWithReferencesGroupReference.
	
	returningClause --|> clause.
	returningClause --|> tWithColumnReference.
	returningClause --|> tWithReferencesGroupReference.
	returningClause --|> #TWithAccesses.
	returningClause --|> #TWithInvocations.
	
	setClause --|> clause.
	setClause --|> tWithDerivedTableReference.
	setClause --|> tWithColumnReference.
	setClause --|> #TWithAccesses.
	setClause --|> #TWithInvocations.
	
	selectClause --|> clause.
	selectClause --|> tWithColumnReference.
	selectClause --|> #TWithAccesses.
	selectClause --|> #TWithInvocations.
	selectClause --|> tWithTableReference. "Through table.column ref."
	selectClause --|> tWithDerivedTableReference. "For aliased_derived_table.column ref."
	selectClause --|> tWithViewReference. "For view.column ref."
	
	groupByClause --|> clause.
	groupByClause --|> tWithColumnReference.
	groupByClause --|> tWithTableReference. "For table.column ref."
	groupByClause --|> tWithViewReference. "For view.column ref."
	groupByClause --|> tWithReferencesGroupReference.
	groupByClause --|> #TWithAccesses.
	groupByClause --|> #TWithInvocations.
	
	havingClause --|> clause.
	havingClause --|> tWithColumnReference.
	havingClause --|> tWithTableReference. "For table.column ref."
	havingClause --|> tWithViewReference. "For view.column ref."
	havingClause --|> tWithReferencesGroupReference.
	havingClause --|> #TWithAccesses.
	havingClause --|> #TWithInvocations.
	
	orderByClause --|> clause.
	orderByClause --|> tWithColumnReference.
	orderByClause --|> tWithTableReference. "For table.column ref."
	orderByClause --|> tWithViewReference. "For view.column ref."
	orderByClause --|> tWithReferencesGroupReference.
	orderByClause --|> #TWithAccesses.
	orderByClause --|> #TWithInvocations.
	
	onConflictClause --|> clause.
	
	withClause --|> clause.
	
	joinClause --|> clause.
	
	unionClause --|> clause.
	unionClause --|> tWithDerivedTableReference.
	unionClause --|> tWithTableReference.
	unionClause --|> tWithViewReference.
	
	intersectClause --|> clause.
	intersectClause --|> tWithDerivedTableReference.
	intersectClause --|> tWithTableReference.
	intersectClause --|> tWithViewReference.
	
	exceptClause --|> clause.
	exceptClause --|> tWithDerivedTableReference.
	exceptClause --|> tWithTableReference.
	exceptClause --|> tWithViewReference.
	
	valuesClause --|> clause.
	valuesClause --|> tWithDerivedTableReference.
	valuesClause --|> tWithColumnReference.
	valuesClause --|> #TWithAccesses.
	valuesClause --|> #TWithInvocations.
	
	usingClause --|> clause.
	usingClause --|> tWithTableReference.
	
	intoClause --|> clause.
	intoClause --|> tWithTableReference.
	intoClause --|> tWithColumnReference.
	
	limitClause --|> clause
]

{ #category : #definition }
FmxSQLMetamodelGenerator >> defineHierarchy [
	super defineHierarchy.
	self
		defineBehaviouralHierarchy;
		defineClausesHierarchy;
		defineBehaviouralReferencesHierarchy
]

{ #category : #definition }
FmxSQLMetamodelGenerator >> defineProperties [
	super defineProperties.
	self defineBehaviouralEntitiesProperties
]

{ #category : #'definition - behavioural' }
FmxSQLMetamodelGenerator >> defineReferences [
	viewReference := builder
		newClassNamed: #ViewReference
		comment: self viewReferenceComment.	"Concrete reference entities."
	derivedTableReference := builder
		newClassNamed: #DerivedTableReference
		comment: self derivedTableReferenceComment.
	parameterAccess := builder
		newClassNamed: #ParameterAccess
		comment: self parameterAccessComment.
	parameterAccess withTesting.
	cursorParameterAccess := builder
		newClassNamed: #CursorParameterAccess
		comment: self cursorParameterAccessComment.
	cursorReference := builder
		newClassNamed: #CursorReference
		comment: self cursorReferenceComment.
	storedProcedureCall := builder
		newClassNamed: #StoredProcedureCall
		comment: self storedProcedureCallComment.
	storedProcedureCall withTesting.
	localVariableAccess := builder
		newClassNamed: #LocalVariableAccess
		comment: self localVariableAccessComment.
	localVariableAccess withTesting.
	aliasAccess := builder
		newClassNamed: #AliasAccess
		comment: self aliasAccessComment.
	aliasAccess withTesting.
	columnAliasAccess := builder newClassNamed: #ColumnAliasAccess.
	columnsContainerAliasAccess := builder
		newClassNamed: #ColumnsContainerAliasAccess.
	referencesGroup := builder
		newClassNamed: #ReferencesGroup
		comment: self referencesGroupComment.
	referencesGroupReference := builder
		newClassNamed: #ReferencesGroupReference
		comment: self referencesGroupReferenceComment
]

{ #category : #definition }
FmxSQLMetamodelGenerator >> defineRelations [
	super defineRelations.
	self
		defineBehaviouralEntitiesRelations;
		defineBehaviouralTraitsRelations;
		defineBehaviouralReferenceEntities
]

{ #category : #definition }
FmxSQLMetamodelGenerator >> defineTraits [
	super defineTraits.
	self defineBehaviouralTraits
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> deleteQueryComment [
	^ 'I am an DELETE query.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> derivedTableComment [
	^ 'I am a derived table. A derived table is a temporary table created to store temporarily the results of a sub-select query in a select query. Such tables are not globally named as a Tableor a View because they can not be accessed outside the query in which they are computed (which is also the query defining them). Nonetheless, they can get an alias to be referenced inside the query. .'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> derivedTableReferenceComment [
	^ 'I am a reference to a derived table.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> entitySourceAnchorComment [
	^ 'I am a source anchor which anchor source code held by an entity with immediate source.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> exceptClauseComment [
	^ 'I am an except clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> foreignTableComment [
	^ 'I am a foreign table, that is to say, my data source is not inside the database.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> fromClauseComment [
	^ 'I am a from clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> groupByClauseComment [
	^ 'I am a group by clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> havingClauseComment [
	^ 'I am a having clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> insertQueryComment [
	^ 'I am an INSERT query.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> intersectClauseComment [
	^ 'I am an intersect clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> intoClauseComment [
	^ 'I am an into clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> joinClauseComment [
	^ 'I am a join clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> limitClauseComment [
	^ 'I am a limit clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> localVariableAccessComment [
	^ 'I am an access to a local variable in a procedure.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> localVariableComment [
	^ 'I am a local variable of a stored procedure. I have a type.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> newLocalVariableComment [
	^ 'I model the special NEW local variable accessible from inside trigger stored procedure.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> oldLocalVariableComment [
	^ 'I model the special OLD local variable accessible from inside trigger stored procedure.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> orderByClauseComment [
	^ 'I am an order by clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> parameterAccessComment [
	^ 'I am an access to a stored procedure parameter.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> parameterComment [
	^ 'I am a parameter of a stored procedure. I have a type.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> recordLocalVariableComment [
	^ 'I am local variable of type record. I can contain columns. These columns are set when a SELECT INTO is encountered.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> referencesGroupComment [
	^ 'I model a group of refererences to other entities.

I provide an abstraction to avoid modelling the AST in the MM.

For example I can appear in select query like:

SELECT fct1(id)+fct2(id) AS id -- <-- Here a reference group is created containing ref to fct1, fct2
FROM table'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> referencesGroupReferenceComment [
	self flag: #TODO.
	^ 'TODO'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> returningClauseComment [
	^ 'I am a returning clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> selectClauseComment [
	^ 'I am a select clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> selectQueryComment [
	^ 'I am a SELECT query.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> setClauseComment [
	^ 'I am a set clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> storedProcedureCallComment [
	^ 'I am a call to a stored procedure of the model.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> storedProcedureComment [
	^ 'I am a stored procedure. That is to say, a function that is defined inside the database.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> triggerComment [
	^ 'I am a trigger. A trigger allows to define actions to performs when a specific event occurs on a table. Because a trigger can not exist without the table to which it listens to events, a trigger is contained in a table.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> triggerStoredProcedureComment [
	^ 'I am a special stored procedure used to define the actions a trigger perform.

This concept does not exists in all DBMS (for example, in MySQL a trigger has a body directly defined when defining the trigger). Nevertheless, it allows to unify the different approach take by different DBMS. In the meta-model, a trigger is always defined as referencing a trigger stored procedure. For DBMS where it is not implemented like that in reality, the trigger stored procedure as no name because it is virtual.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> unionClauseComment [
	^ 'I am an union clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> updateQueryComment [
	^ 'I am an UPDATE query.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> usingClauseComment [
	^ 'I am an using clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> valuesClauseComment [
	^ 'I am a Values clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> valuesQueryComment [
	^ 'I am a VALUES query.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> viewComment [
	^ 'I am a view. I can be used transparently as a table but I do not hold data. My data are fetched by the SELECT query which defines myself.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> viewReferenceComment [
	^ 'I am a reference to a view.'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> whereClauseComment [
	^ 'I am a where clause'
]

{ #category : #'comments - SQL' }
FmxSQLMetamodelGenerator >> withClauseComment [
	^ 'I am a with clause'
]
