Class {
	#name : #FmxSQLDeprecatedMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'entity',
		'sourceAnchor',
		'constraint',
		'queryContainer',
		'crudQuery',
		'table',
		'type',
		'checkConstraint',
		'primaryKeyConstraint',
		'foreignKeyConstraint',
		'notNullConstraint',
		'uniqueConstraint',
		'column',
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
		'reference',
		'tableReference',
		'columnReference',
		'typeReference',
		'storedProcedureCall',
		'structuralEntity',
		'derivedTable',
		'viewReference',
		'derivedTableReference',
		'tNamedEntity',
		'tColumnsContainer',
		'tSourcedEntity',
		'behaviouralEntity',
		'namespace',
		'tEntityInNamespace',
		'tAbstractType',
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
		'tReferenceContainer',
		'alias',
		'aliasAccess'
	],
	#category : 'FAMIXNGSQLMetamodelGenerator-Deprecated'
}

{ #category : #'meta-model regeneration' }
FmxSQLDeprecatedMetamodelGenerator class >> inheritanceTopClassesNames [
	"Returns the name of classes that are on top of the inheritance tree of the meta-model."
	^ #('EntityGenerated' 'SourcedEntityGenerated' 'StructuralEntityGenerated') collect: [ :suffix |
		(self prefix , suffix) asSymbol ]
]

{ #category : #deprecation }
FmxSQLDeprecatedMetamodelGenerator class >> isDeprecated [
	^ true
]

{ #category : #accessing }
FmxSQLDeprecatedMetamodelGenerator class >> packageName [
	^ 'FamixNGSQL'
]

{ #category : #accessing }
FmxSQLDeprecatedMetamodelGenerator class >> prefix [
	^ 'FmxSQL'
]

{ #category : #'meta-model regeneration' }
FmxSQLDeprecatedMetamodelGenerator class >> regenerateMetaModel [
	<script>
	"Warning, all classes having methods referencing one of the class of the meta-model should be recompiled. Else you will get errors about obsolete classes."
	
	"1. Ensure that no more instances of the meta-model exist in the system."
	self inheritanceTopClassesNames do: [ :className |
		Smalltalk globals
			at: className
			ifPresent: [ :c | c allSubInstances do: [ :e | e becomeForward: nil ] ]
			ifAbsent: [ UIManager default inform: className , ' not present, could not make references become forward nil.' ] ].
	Smalltalk garbageCollect.
	
	"2. Re-generate the meta-model."
	self new
		generateWithoutCleaning
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> aliasAccessComment [
	^ 'I am an access to an alias.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> checkConstraintComment [
	^ 'I represent a CHECK constraint as defined in SQL standard.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> columnComment [
	^ 'I represent a Column in the relational model.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> columnReferenceComment [
	^ 'I am reference to a column in a table of the model.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> columnsContainerComment [
	^ 'I am an abstract super class for entities that contain columns. Two of my well-known subclasses are the table and the view.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> constraintComment [
	^ 'I am an abstract superclass for constraints. A constraint restrict the possible values that can be stored in a column of a table.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> crudQueryComment [
	^ 'I am an abstract superclass for Create Read Update Delete (CRUD) queries.

The Create query is the INSERT query in SQL.

The Read query is the SELECT query in SQL.

The Update query is the UPDATE query in SQL.

The Delete query is the DELETE query in SQL.

My subclasses represent these four queries.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> cursorParameterAccessComment [
	^ 'I am an access to a cursor parameter.'
]

{ #category : #comment }
FmxSQLDeprecatedMetamodelGenerator >> cursorReferenceComment [
	^ 'I am a reference to a cursor'
]

{ #category : #definition }
FmxSQLDeprecatedMetamodelGenerator >> define [
	self
		defineFamixMetaModelEntities;
		defineFamixMetaModelEntitiesRelations;
		defineFamixMetaModelEntitiesProperties.
	
	self
		defineSQLMetaModelEntities;
		defineClausesEntities;
		defineSQLMetaModelInheritanceRelations;
		defineSQLStructuralEntitiesRelations;
		defineSQLBehaviouralEntitiesRelations;
		defineSQLBehaviouralEntitiesProperties;
		defineSQLReferenceEntitiesRelations
]

{ #category : #'definitions - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> defineClausesEntities [
	"Clause entities."

	clause := builder newClassNamed: #Clause comment: 'I am an abstract clause'.
	withClause := builder newClassNamed: #WithClause comment: 'I am a with clause'.
	whereClause := builder newClassNamed: #WhereClause comment: 'I am a where clause'.
	returningClause := builder newClassNamed: #ReturningClause comment: 'I am a returning clause'.
	onConflictClause := builder newClassNamed: #OnConflictClause comment: 'I am a on conflict clause'.
	setClause := builder newClassNamed: #SetClause comment: 'I am a set clause'.
	fromClause := builder newClassNamed: #FromClause comment: 'I am a from clause'.
	selectClause := builder newClassNamed: #SelectClause comment: 'I am a select clause'.
	groupByClause := builder newClassNamed: #GroupByClause comment: 'I am a group by clause'.
	havingClause := builder newClassNamed: #HavingClause comment: 'I am a having clause'.
	orderByClause := builder newClassNamed: #OrderByClause comment: 'I am an order by clause'.
	joinClause := builder newClassNamed: #JoinClause comment: 'I am a join clause'.
	unionClause := builder newClassNamed: #UnionClause comment: 'I am an union clause'.
	intersectClause := builder newClassNamed: #IntersectClause comment: 'I am an intersect clause'.
	exceptClause := builder newClassNamed: #ExceptClause comment: 'I am an except clause'.
	valuesClause := builder newClassNamed: #ValuesClause comment: 'I am a Values clause'.
	usingClause := builder newClassNamed: #UsingClause comment: 'I am an using clause'.
	intoClause := builder newClassNamed: #IntoClause comment: 'I am an into clause'.
	limitClause := builder newClassNamed: #LimitClause comment: 'I am a limit clause'.
	
	"A clause is a reference container"
	tReferenceContainer <|-- clause.
	
	"Defining all kinds of clauses"	
	clause <|-- withClause.
	clause <|-- whereClause.
	clause <|-- returningClause.
	clause <|-- onConflictClause.
	clause <|-- setClause.
	clause <|-- fromClause.
	clause <|-- selectClause.
	clause <|-- groupByClause.
	clause <|-- havingClause.
	clause <|-- orderByClause.
	clause <|-- joinClause.
	clause <|-- unionClause.
	clause <|-- intersectClause.
	clause <|-- exceptClause.
	clause <|-- valuesClause.
	clause <|-- usingClause.
	clause <|-- intoClause.
	clause <|-- limitClause
]

{ #category : #'definitions - FAMIX' }
FmxSQLDeprecatedMetamodelGenerator >> defineFamixMetaModelEntities [
	entity := builder newClassNamed: #Entity.
	sourceAnchor := builder newClassNamed: #SourceAnchor.
	tNamedEntity := builder newTraitNamed: #NamedEntity.
	tSourcedEntity := builder newTraitNamed: #SourcedEntity.
	behaviouralEntity := builder newClassNamed: #BehaviouralEntity.
	tAbstractType := builder newTraitNamed: #AbstractType
	
]

{ #category : #'definitions - FAMIX' }
FmxSQLDeprecatedMetamodelGenerator >> defineFamixMetaModelEntitiesProperties [
	tNamedEntity
		property: #name type: #String.
		
	tSourcedEntity
		property: #sourceCode type: #String.
		
	(sourceAnchor as: #TSourceAnchor)
		property: #lineBegin type: #Number;
		property: #lineEnd type: #Number;
		property: #columnBegin type: #Number;
		property: #columnEnd type: #Number
]

{ #category : #'definitions - FAMIX' }
FmxSQLDeprecatedMetamodelGenerator >> defineFamixMetaModelEntitiesRelations [
	"Inheritance relations definitions."
	entity <|-- sourceAnchor.
	tSourcedEntity <|-- behaviouralEntity.
	
]

{ #category : #'definitions - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> defineSQLBehaviouralEntitiesProperties [
	(trigger as: #TTrigger) trait
		property: #firingAction type: #String;
		property: #when type: #String
]

{ #category : #'definitions - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> defineSQLBehaviouralEntitiesRelations [
	"A sourced entity contains a source anchor"
	(tSourcedEntity as: #TSourcedEntity property: #sourceAnchor)
		<>-
	(sourceAnchor as: #TSourceAnchor property: #behaviouralEntity).
	
	"A CheckConstraint can call StoredProcedures"
	(checkConstraint as: #TCheckConstraint property: #storedProceduresCalled)
		*-*
	(storedProcedure as: #TStoredProcedure property: #checkConstraintsCalling).
	
	"A View is defined as a SelectQuery, thus, in the meta-model, a view contains a SelectQuery."
	(view as: #TView property: #query)
		<>-
	(selectQuery as: #TSelectQuery property: #viewDefining).
	
	"A DerivedTable is defined as a SelectQuery, thus, in the meta-model, a view contains a SelectQuery."
	(derivedTable as: #TDerivedTable property: #query)
		<>-
	(selectQuery as: #TSelectQuery property: #derivedTableDefining).
	
	"A SelectQuery can define multiple derived tables."
	(selectQuery as: #TSelectQuery property: #derivedTablesDefined)
		<>-*
	(derivedTable as: #TDerivedTable property: #parentQuery).
	
	"A StoredProcedure has a return AbstractType."
	(storedProcedure as: #TStoredProcedure property: #returnType)
		*-
	(tAbstractType property: #storedProceduresReturning).
	
	"A StoredProcedure may have parameters."
	(storedProcedure as: #TStoredProcedure property: #parameters)
		<>-*
	(parameter as: #TParameter property: #storedProcedure).
	
	"A StoredProcedure may have local variables."
	(storedProcedure as: #TStoredProcedure property: #localVariables)
		<>-*
	(localVariable as: #TLocalVariable property: #storedProcedure).
	
	"A Cursor may have cursor parameters."
	(cursor as: #TCursor property: #parameters)
		<>-*
	(cursorParameter as: #TCursorParameter property: #cursor).
	
	"A LocalVariable has an AbstractType."
	(localVariable as: #TLocalVariable property: #type)
		*-
	(tAbstractType property: #localVariables).
	
	"A Parameter has an AbstractType."
	(parameter as: #TParameter property: #type)
		*-
	(tAbstractType property: #parameters).
	
	"A Cursor Parameter has an AbstractType."
	(cursorParameter as: #TCursorParameter property: #type)
		*-
	(tAbstractType property: #cursorParameters).
	
	"A stored procedure used by a trigger can reference Columns."
	(triggerStoredProcedure as: #TTriggerStoredProcedure property: #columnsReferenced)
		<>-*
	(columnReference as: #TColumnReference property: #triggerStoredProceduresReferencing).
	
	"The generalized trigger is now defined as always referencing a TriggerStoredProcedure.
	For DBMS where the trigger code is directly defined in the trigger, a virtual TriggerStoredProcedure
	is created to hold its source code."
	(trigger as: #TTrigger property: #storedProcedure)
		*-
	(triggerStoredProcedure as: #TTriggerStoredProcedure property: #triggers).
	
	"A Trigger is contained in a Table. This is composition because, if the Table is removed,
	 the Trigger should be as well because it makes no sense to have a a trigger reacting to
	events of a non-existing table."
	(table as: #TTable property: #triggers)
		<>-*
	(trigger as: #TTrigger property: #table).
	
	"A clause may define aliases"
	(clause as: #TClause property: #aliases)
		<>-*
	(alias as: #TAlias property: #clause).
]

{ #category : #'definitions - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> defineSQLMetaModelEntities [
	"Abstract entities."
	tEntityInNamespace := builder newTraitNamed: #EntityInNamespace comment: self entityInNamespaceComment.
	structuralEntity := builder newClassNamed: #StructuralEntity comment: self structuralEntityComment.
	constraint := builder newClassNamed: #Constraint comment: self constraintComment.
	tColumnsContainer := builder newTraitNamed: #ColumnsContainer comment: self columnsContainerComment.
	queryContainer := builder newClassNamed: #QueryContainer comment: self queryContainerComment.
	crudQuery := builder newClassNamed: #CRUDQuery comment: self crudQueryComment.
	reference := builder newClassNamed: #Reference comment: self referenceComment.
	tReferenceContainer := builder newTraitNamed: #TReferenceContainer comment: self tReferenceContainerComment.
	"Concrete structural entities."
	namespace := builder newClassNamed: #Namespace comment: self namespaceComment.
	table := builder newClassNamed: #Table comment: self tableComment.
	column := builder newClassNamed: #Column comment: self columnComment.
	type := builder newClassNamed: #Type comment: self typeComment.
	checkConstraint := builder newClassNamed: #CheckConstraint comment: self checkConstraintComment.
	primaryKeyConstraint := builder newClassNamed: #PrimaryKeyConstraint comment: self primaryKeyConstraintComment.
	foreignKeyConstraint := builder newClassNamed: #ForeignKeyConstraint comment: self foreignKeyConstraintComment.
	notNullConstraint := builder newClassNamed: #NotNullConstraint comment: self nullConstraintComment.
	uniqueConstraint := builder newClassNamed: #UniqueConstraint comment: self uniqueConstraintComment.
	"Concrete behavioural entities."
	view := builder newClassNamed: #View comment: self viewComment.
	derivedTable := builder newClassNamed: #DerivedTable comment: self derivedTableComment.
	storedProcedure := builder newClassNamed: #StoredProcedure comment: self storedProcedureComment.
	triggerStoredProcedure := builder newClassNamed: #TriggerStoredProcedure comment: self triggerStoredProcedureComment.
	trigger := builder newClassNamed: #Trigger comment: self triggerComment.
	selectQuery := builder newClassNamed: #SelectQuery comment: self selectQueryComment.
	insertQuery := builder newClassNamed: #InsertQuery comment: self insertQueryComment.
	updateQuery := builder newClassNamed: #UpdateQuery comment: self updateQueryComment.
	deleteQuery := builder newClassNamed: #DeleteQuery comment: self deleteQueryComment.
	parameter := builder newClassNamed: #Parameter comment: self parameterComment.
	localVariable := builder newClassNamed: #LocalVariable comment: self localVariableComment.
	cursor := builder newClassNamed: #Cursor comment: 'I am a cursor, a local iterator that can have parameters'.
	cursorParameter := builder newClassNamed: #CursorParameter comment: 'I am a cursor parameter'.
	alias := builder newClassNamed: #Alias comment: 'I am an Alias'.
	"Concrete reference entities."
	tableReference := builder newClassNamed: #TableReference comment: self tableReferenceComment.
	viewReference := builder newClassNamed: #ViewReference comment: self viewReferenceComment.
	derivedTableReference := builder newClassNamed: #DerivedTableReference comment: self derivedTableReferenceComment.
	parameterAccess := builder newClassNamed: #ParameterAccess comment: self parameterAccessComment.
	cursorParameterAccess := builder newClassNamed: #CursorParameterAccess comment: self cursorParameterAccessComment.
	columnReference := builder newClassNamed: #ColumnReference comment: self columnReferenceComment.
	typeReference := builder newClassNamed: #TypeReference comment: self typeReferenceComment.
	cursorReference := builder newClassNamed: #CursorReference comment: self cursorReferenceComment.
	storedProcedureCall := builder newClassNamed: #StoredProcedureCall comment: self storedProcedureCallComment.
	localVariableAccess := builder newClassNamed: #LocalVariableAccess comment: self localVariableAccessComment.
	aliasAccess := builder newClassNamed: #AliasAccess comment: self aliasAccessComment.
]

{ #category : #'definitions - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> defineSQLMetaModelInheritanceRelations [
	"Abstract entities inheritance relations."

	tNamedEntity <|-- structuralEntity.
	structuralEntity <|-- constraint.
	tSourcedEntity <|-- behaviouralEntity.
	behaviouralEntity <|-- queryContainer.
	tSourcedEntity <|-- reference.
	"Concrete structural entities inheritance relations."
	structuralEntity <|-- namespace.
	structuralEntity <|-- table.
	tColumnsContainer <|-- table.
	structuralEntity <|-- column.
	structuralEntity <|-- type.
	tAbstractType <|-- type.
	tAbstractType <|-- table.
	tAbstractType <|-- view.
	constraint <|-- checkConstraint.
	"behaviouralEntity <|-- checkConstraint."
	tSourcedEntity <|-- checkConstraint.
	self flag: 'Should inherit this from Behavioural entity but apparently it s not.'.
	constraint <|-- primaryKeyConstraint.
	constraint <|-- foreignKeyConstraint.
	constraint <|-- notNullConstraint.
	constraint <|-- uniqueConstraint.
	"Concrete behavioural entities inheritance relations."
	tColumnsContainer <|-- view.
	queryContainer <|-- view.
	tEntityInNamespace <|-- view.
	tNamedEntity <|-- view.
	tColumnsContainer <|-- derivedTable.
	queryContainer <|-- derivedTable.
	queryContainer <|-- storedProcedure.
	tEntityInNamespace <|-- storedProcedure.
	tNamedEntity <|-- storedProcedure.
	tReferenceContainer <|-- storedProcedure.
	storedProcedure <|-- triggerStoredProcedure.
	behaviouralEntity <|-- trigger.
	tEntityInNamespace <|-- trigger.
	tNamedEntity <|-- trigger.
	crudQuery <|-- selectQuery.
	crudQuery <|-- insertQuery.
	crudQuery <|-- updateQuery.
	crudQuery <|-- deleteQuery.
	tNamedEntity <|-- parameter.
	tNamedEntity <|-- localVariable.
	tNamedEntity <|-- cursorParameter.
	tNamedEntity <|-- alias.
	queryContainer <|-- cursor.
	tReferenceContainer <|-- alias.
	tReferenceContainer <|-- storedProcedure.
	tReferenceContainer <|-- clause.
	"Concrete reference entities inheritance relations."
	reference <|-- tableReference.
	reference <|-- derivedTableReference.
	reference <|-- viewReference.
	reference <|-- parameterAccess.
	reference <|-- cursorParameterAccess.
	reference <|-- columnReference.
	reference <|-- typeReference.
	reference <|-- storedProcedureCall.
	reference <|-- localVariableAccess.
	reference <|-- cursorReference.
	reference <|-- aliasAccess.
]

{ #category : #'definitions - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> defineSQLReferenceEntitiesRelations [
	"A stored procedure contains abstract references (regrouping variable accesses, references to views, tables...)"

	(tReferenceContainer as: #TReferenceContainer property: #references)
		<>-* (reference as: #TReference property: #container).

	"A leaf access references a leaf entity."
	(parameterAccess as: #TParameterAccess property: #parameter)
		*- (parameter as: #TParameter property: #accesses).
		
	"A leaf access references a leaf entity."
	(cursorParameterAccess as: #TCursorParameterAccess property: #parameter)
		*- (cursorParameter as: #TCursorParameter property: #accesses).

	"A type reference references a type."
	(typeReference as: #TTypeReference property: #type)
		*- (type as: #TType property: #references).

	"A table reference references a table."
	(tableReference as: #TTableReference property: #table)
		*- (table as: #TTable property: #references).

	"A view reference references a view."
	(viewReference as: #TViewReference property: #view)
		*- (view as: #TView property: #references).

	"A derived table reference references a derived table."
	(derivedTableReference as: #TDerivedTableReference property: #derivedTable)
		*- (derivedTable as: #TDerivedTable property: #references).

	"A column reference references a column."
	(columnReference as: #TColumnReference property: #column)
		*- (column as: #TColumn property: #references).

	"A stored procedure call calls a stored procedure."
	(storedProcedureCall as: #TStoredProcedureCall property: #storedProcedure)
		*- (storedProcedure as: #TStoredProcedure property: #calls).

	"A stored procedure call can contain other references (in its arguments)."
	(storedProcedureCall as: #TStoredProcedureCall property: #arguments)
		<>-* (reference as: #TReference property: #storedProcedureContainer).

	"A Local variable access must point a local variable."
	(localVariableAccess as: #TLocalVariableAccess property: #localVariable)
		*- (localVariable as: #TLocalVariable property: #accesses).

	"A query contains multiple clauses"
	(crudQuery as: #TCrudQuery property: #clauses)
		<>-* (clause as: #TClause property: #query).

	"A QueryContainer contains multiple queries"
	(queryContainer as: #TQueryContainer property: #queries)
		<>-* (crudQuery as: #TCrudQuery property: #container).

	"An update query target a table"
	(table as: #TTable property: #updateQueries)
		-* (updateQuery as: #TUpdateQuery property: #table).
		
	"A cursor reference references a cursor."
	(cursorReference as: #TCursorReference property: #cursor)
		*- (cursor as: #TCursor property: #references).
		
	"An alias access reference an Alias."
	(aliasAccess as: #TAliasAccess property: #alias)
		*- (alias as: #TAlias property: #accesses).
]

{ #category : #'definitions - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> defineSQLStructuralEntitiesRelations [
	"A columns container contains columns."

	(tColumnsContainer property: #columns)
		<>-* (column as: #TColumn property: #columnsContainer).

	"A column references a type."
	(column as: #TColumn property: #type) *- (type as: #TType property: #columns).

	"A constraint references at least one column concerned by the constraint."
	(constraint as: #TConstraint property: #columns)
		*-* (column as: #TColumn property: #constraints).

	"A Constraint is contained in a Table."
	(table as: #TTable property: #constraints)
		<>-* (constraint as: #TConstraint property: #table).

	"A foreign key constraint references at least one column from another table."
	(foreignKeyConstraint as: #TForeignKeyConstraint property: #referencedColumns)
		*-* (column as: #TColumn property: #foreignKeyConstraintsReferencing).

	"A table eventually has inheritance sub tables and zero or one inheritance super table."
	(table as: #TTable property: #superTable)
		*- (table as: #TTable property: #subTables).

	"Any entityInNamespace can be part of a namespace"
	(tEntityInNamespace property: #namespace)
		*-<> (namespace as: #TNamespace property: #entities)
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> deleteQueryComment [
	^ 'I am an DELETE query.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> derivedTableComment [
	^ 'I am a derived table. A derived table is a temporary table created to store temporarily the results of a sub-select query in a select query. Such tables are not globally named as a Tableor a View because they can not be accessed outside the query in which they are computed (which is also the query defining them). Nonetheless, they can get an alias to be referenced inside the query. .'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> derivedTableReferenceComment [
	^ 'I am a reference to a derived table.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> entityInNamespaceComment [
	^ 'I am a trait that any entity which can be part of a namespace use.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> foreignKeyConstraintComment [
	^ 'I represent a FOREIGN KEY constraint as defined in SQL standard.'
]

{ #category : #initialization }
FmxSQLDeprecatedMetamodelGenerator >> initialize [

	super initialize.
	
	builder := FamixMetamodelBuilder new.
	builder
		packageName: self class packageName;
		prefix: self class prefix;
		generator: self
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> insertQueryComment [
	^ 'I am an INSERT query.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> localVariableAccessComment [
	^ 'I am an access to a local variable in a procedure.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> localVariableComment [
	^ 'I am a local variable of a stored procedure. I have a type.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> namespaceComment [
	^ 'I am a namespace. I hold entities to define a name scope where name duplicates are forbidden.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> nullConstraintComment [
	^ 'I represent a NOT NULL constraint as defined in SQL standard.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> parameterAccessComment [
	^ 'I am an access to a stored procedure parameter.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> parameterComment [
	^ 'I am a parameter of a stored procedure. I have a type.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> primaryKeyConstraintComment [
	^ 'I represent a PRIMARY KEY constraint as defined in SQL standard.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> queryContainerComment [
	^ 'I am an abstract super class for behavioural entities that can contain queries in their source code.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> referenceComment [
	^ 'I am an abstract object that represent a reference made to another entity in the source code a behavioural entity.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> selectQueryComment [
	^ 'I am a SELECT query.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> storedProcedureCallComment [
	^ 'I am a call to a stored procedure of the model.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> storedProcedureComment [
	^ 'I am a stored procedure. That is to say, a function that is defined inside the database.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> structuralEntityComment [
	^ 'I am an abstract superclass for structural entities. A structural entity is an entity that defines how data are structured by the database.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> tReferenceContainerComment [
	^ 'I am a trait for entities containing references (storedProcedure, Clause and Alias).'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> tableComment [
	^ 'I represent a Table in the relational model.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> tableReferenceComment [
	^ 'I am a reference to a table.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> triggerComment [
	^ 'I am a trigger. A trigger allows to define actions to performs when a specific event occurs on a table. Because a trigger can not exist without the table to which it listens to events, a trigger is contained in a table.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> triggerStoredProcedureComment [
	^ 'I am a special stored procedure used to define the actions a trigger perform.

This concept does not exists in all DBMS (for example, in MySQL a trigger has a body directly defined when defining the trigger). Nevertheless, it allows to unify the different approach take by different DBMS. In the meta-model, a trigger is always defined as referencing a trigger stored procedure. For DBMS where it is not implemented like that in reality, the trigger stored procedure as no name because it is virtual.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> typeComment [
	^ 'I represent a Type in the database. I can be used for a column, a local variable, a parameter, etc...'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> typeReferenceComment [
	^ 'I am reference to a type of the model.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> uniqueConstraintComment [
	^ 'I represent a UNIQUE constraint as defined in SQL standard.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> updateQueryComment [
	^ 'I am an UPDATE query.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> viewComment [
	^ 'I am a view. I can be used transparently as a table but I do not hold data. My data are fetched by the SELECT query which defines myself.'
]

{ #category : #'comments - SQL' }
FmxSQLDeprecatedMetamodelGenerator >> viewReferenceComment [
	^ 'I am a reference to a view.'
]
