"
I build a model described by the FamixNGSQL meta-model from a connection to a PostgreSQL database.

Internally, I use PgMetadata and PostgreSQLParser.
"
Class {
	#name : #FmxSQLModelBuilder,
	#superclass : #Object,
	#instVars : [
		'databaseName',
		'connection',
		'metadata',
		'pgToFamixEntities',
		'errorReport'
	],
	#category : #'FamixNGSQL-Importer-Metadata'
}

{ #category : #accessing }
FmxSQLModelBuilder class >> pgClassTableColumnsNames [
	^ #(oid relname relnamespace reltype reloftype relowner relam relfilenode reltablespace relpages reltuples relallvisible reltoastrelid relhasindex relisshared relpersistence relkind relnatts relchecks relhasoids relhasrules relhastriggers relhassubclass relrowsecurity relforcerowsecurity relispopulated relreplident relispartition relrewrite relfrozenxid relminmxid relacl reloptions relpartbound)
]

{ #category : #'model building - specials' }
FmxSQLModelBuilder >> addSpecialFunctions: mooseModel [
	FmxSQLStoredProcedure new
		name: 'exists';
		isStub: true;
		mooseModel: mooseModel.
		
	FmxSQLStoredProcedure new
		name: 'now';
		isStub: true;
		mooseModel: mooseModel
]

{ #category : #'model building - specials' }
FmxSQLModelBuilder >> addSpecialTables: mooseModel [
	| pgClass |
	pgClass := FmxSQLTable new
		name: 'pg_class';
		isStub: true;
		mooseModel: mooseModel.
	self addStubColumns: self class pgClassTableColumnsNames toTable: pgClass.
]

{ #category : #'model building - specials' }
FmxSQLModelBuilder >> addStubColumns: columnsNames toTable: aFmxSQLTable [
	columnsNames do: [ :str |
		FmxSQLColumn new
			name: str;
			isStub: true;
			columnsContainer: aFmxSQLTable;
			mooseModel: aFmxSQLTable mooseModel ]
]

{ #category : #'model building' }
FmxSQLModelBuilder >> buildModel [
	"Build an instance of MooseModel from the connection to the database and returns it."
	| mooseModel |
	mooseModel := FmxSQLMooseModel new
						name: self databaseName;
						yourself.
	pgToFamixEntities := Dictionary new.
	self
		addSpecialTables: mooseModel;
		addSpecialFunctions: mooseModel;
		loadMetaData;
		createNamespacesIn: mooseModel;
		createTypesIn: mooseModel;
		createTablesIn: mooseModel;
		createForeignTablesIn: mooseModel;
		createConstraintsIn: mooseModel;
		createViewsIn: mooseModel;
		createStoredProceduresIn: mooseModel;
		createTriggerStoredProceduresIn: mooseModel;
		createTriggersIn: mooseModel.
	"Need to do it in 2 steps because views can reference each others."
	self
		createTableInheritanceRelationsFor: mooseModel;
		visitViewsDefinitionsFor: mooseModel;
		visitStoredProceduresFor: mooseModel;
		linkColumnReferencesToNewAndOldLocalVariableFor: mooseModel;
		createSourceAnchorsOfQualifiedNamesFor: mooseModel.
	mooseModel
		errorReport: self errorReport.
	pgToFamixEntities := nil.
	
	^ mooseModel
]

{ #category : #accessing }
FmxSQLModelBuilder >> connection [
	^ connection
]

{ #category : #accessing }
FmxSQLModelBuilder >> connection: anObject [
	connection := anObject
]

{ #category : #'model building - entities' }
FmxSQLModelBuilder >> createConstraintsIn: aMooseModel [
	metadata getConstraints
		do: [ :o | o asFmxSQLEntityIn: aMooseModel withMappingdict: pgToFamixEntities ]
		displayingProgress: 'Creating constraints'
]

{ #category : #'model building - entities' }
FmxSQLModelBuilder >> createForeignTablesIn: mooseModel [
	metadata getForeignTables do: [ :pgForeignTable |
		|table|
		table := FmxSQLForeignTable new
						name: pgForeignTable name;
						parentNamespace: (pgToFamixEntities at: pgForeignTable namespace);
						mooseModel: mooseModel;
						yourself.
		pgToFamixEntities at: pgForeignTable put: table.
						
		pgForeignTable columns do: [ :pgColumn |
			pgToFamixEntities
				at: pgColumn
				put: (FmxSQLColumn new
						name: pgColumn name;
						mooseModel: mooseModel;
						columnsContainer: table;
						type: (pgToFamixEntities at: pgColumn datatype);
						yourself).
			pgColumn isNotNull ifTrue: [ 
				|constraint|
				constraint := FmxSQLNotNullConstraint new
					table: table;
					mooseModel: mooseModel;
					yourself.
				FmxSQLColumnReference new
					source: constraint;
					column: (pgToFamixEntities at: pgColumn);
					isWildCardReference: false;
					isCertain: true;
					mooseModel: mooseModel;
					yourself ] ].
		"Add special columns."
		FmxSQLColumn new
			name: 'tableoid';
			columnsContainer: table ] displayingProgress: 'Creating foreign tables'
]

{ #category : #'model building - entities' }
FmxSQLModelBuilder >> createNamespacesIn: aMooseModel [
	metadata getNamespaces do: [ :pgNamespace |
		pgToFamixEntities
			at: pgNamespace
			put: (FmxSQLNamespace new
						name: pgNamespace name;
						mooseModel: aMooseModel;
						yourself) ] displayingProgress: 'Creating namespaces'
]

{ #category : #'model building - linking entities' }
FmxSQLModelBuilder >> createSourceAnchorsOfQualifiedNamesFor: model [
	(model allWithType: FmxSQLQualifiedReference) do: #computeSourceAnchor
]

{ #category : #'model building - entities' }
FmxSQLModelBuilder >> createStoredProceduresIn: aMooseModel [
	(metadata getFunctions
		reject: [ :pgFunction | "Triggers are treated separately." pgFunction isSqlTriggerFunction ])
		do: [ :pgFunction | 
			| function visitor |
			function := FmxSQLStoredProcedure new
				name: pgFunction name;
				parentNamespace: (pgToFamixEntities at: pgFunction namespace);
				returnType: (pgToFamixEntities at: pgFunction returnType);
				source: pgFunction code;
				mooseModel: aMooseModel;
				isStub: (pgFunction isStub or: [ (#('plpgsql' 'sql') includes: pgFunction language name) not ]);
				yourself.
			visitor := FmxSQLSymbolResolutionVisitor
				model: aMooseModel
				function: function
				errorReport: self errorReport.
			pgFunction isSqlTriggerFunction
				ifFalse: [ "Trigger function do not have arguments"
					pgFunction arguments
						do: [ :anArgument | 
							FmxSQLParameter new
								name: anArgument name;
								mooseModel: aMooseModel;
								parentBehaviouralEntity: function;
								type: (visitor findTypeNamed: anArgument datatype name) ] ].
			pgToFamixEntities at: pgFunction put: function ] displayingProgress: 'Creating stored procedures'
]

{ #category : #'model building - linking entities' }
FmxSQLModelBuilder >> createTableInheritanceRelationsFor: mooseModel [
	metadata getTables
		select: [ :pgTable | pgTable parents isNotEmpty ]
		thenDo: [ :pgTable |
			|table parentTables|
			table := pgToFamixEntities at: pgTable.
			parentTables := pgTable parents collect: [ :pgParent | pgToFamixEntities at: pgParent ].
			self assert: parentTables size = 1.
			table superTable: parentTables first ]
]

{ #category : #'model building - entities' }
FmxSQLModelBuilder >> createTablesIn: mooseModel [
	metadata getTables do: [ :pgTable |
		|table|
		table := FmxSQLTable new
						name: pgTable name;
						parentNamespace: (pgToFamixEntities at: pgTable namespace);
						mooseModel: mooseModel;
						yourself.
		pgToFamixEntities at: pgTable put: table.
						
		pgTable columns do: [ :pgColumn |
			pgToFamixEntities
				at: pgColumn
				put: (FmxSQLColumn new
						name: pgColumn name;
						mooseModel: mooseModel;
						columnsContainer: table;
						type: (pgToFamixEntities at: pgColumn datatype);
						yourself).
			pgColumn isNotNull ifTrue: [ 
				|constraint|
				constraint := FmxSQLNotNullConstraint new
					table: table;
					mooseModel: mooseModel;
					yourself.
				FmxSQLColumnReference new
					source: constraint;
					column: (pgToFamixEntities at: pgColumn);
					isWildCardReference: false;
					isCertain: true;
					mooseModel: mooseModel;
					yourself ] ].
		"Add special columns."
		FmxSQLColumn new
			name: 'tableoid';
			columnsContainer: table ] displayingProgress: 'Creating tables'
]

{ #category : #'model building - entities' }
FmxSQLModelBuilder >> createTriggerStoredProceduresIn: aMooseModel [
	metadata getTriggerFunctions
		do: [ :pgFunction | 
			| function |
			function := FmxSQLTriggerStoredProcedure new
				name: pgFunction name;
				parentNamespace: (pgToFamixEntities at: pgFunction namespace);
				returnType: (pgToFamixEntities at: pgFunction returnType);
				source: pgFunction code;
				mooseModel: aMooseModel;
				yourself.
			pgToFamixEntities at: pgFunction put: function.
			"TODO: local variables" ] displayingProgress: 'Creating trigger stored procedures'
]

{ #category : #'model building - entities' }
FmxSQLModelBuilder >> createTriggersIn: aMooseModel [
	self flag: #TODO. "Firing action, when, etc..."
	metadata getTriggers do: [ :pgTrigger |
		|trigger|
		trigger := FmxSQLTrigger new
							name: pgTrigger name;
							parentNamespace: (pgToFamixEntities at: pgTrigger table namespace);
							table: (pgToFamixEntities at: pgTrigger table);
							storedProcedure: (pgToFamixEntities at: pgTrigger function);
							when: pgTrigger whenString;
							firingAction: pgTrigger firingActionString;
							mooseModel: aMooseModel;
							yourself.
		pgToFamixEntities
			at: pgTrigger
			put: trigger. ] displayingProgress: 'Creating triggers'
]

{ #category : #'model building - entities' }
FmxSQLModelBuilder >> createTypesIn: aMooseModel [
	metadata getDatatypes do: [ :pgDataType | 
		pgToFamixEntities
			at: pgDataType
			put: (FmxSQLType new
					name: pgDataType name;
					mooseModel: aMooseModel;
					yourself) ] displayingProgress: 'Creating types'
]

{ #category : #'model building - entities' }
FmxSQLModelBuilder >> createViewsIn: aMooseModel [
	metadata getViews
		do: [ :pgView | 
			| view |
			view := FmxSQLView new
				name: pgView name;
				parentNamespace: (pgToFamixEntities at: pgView namespace);
				source: pgView code;
				mooseModel: aMooseModel;
				yourself.
			pgToFamixEntities at: pgView put: view.
			pgView columns
				do: [ :pgColumn | 
					pgToFamixEntities
						at: pgColumn
						put:
							(FmxSQLColumn new
								name: pgColumn name;
								mooseModel: aMooseModel;
								columnsContainer: view;
								type: (pgToFamixEntities at: pgColumn datatype);
								yourself) ] ] displayingProgress: 'Creating views'
]

{ #category : #accessing }
FmxSQLModelBuilder >> databaseName [
	^ databaseName
]

{ #category : #accessing }
FmxSQLModelBuilder >> databaseName: anObject [
	databaseName := anObject
]

{ #category : #accessing }
FmxSQLModelBuilder >> errorReport [
	errorReport ifNil: [ errorReport := SRParsingReport new ].
	^ errorReport
]

{ #category : #'model building - linking entities' }
FmxSQLModelBuilder >> linkColumnReferencesToNewAndOldLocalVariableFor: model [
	(model allWithType: FmxSQLNewLocalVariable) , (model allWithType: FmxSQLOldLocalVariable) do: [ :newLocalVariable |
		newLocalVariable columns do: [ :varCol |
		(newLocalVariable parentBehaviouralEntity triggers collect: #table) do: [ :table |
			table columns
				detect: [ :tableCol | tableCol name = varCol name ]
				ifFound: [ :tableCol |
					varCol references do: [ :varColRef |
						|copiedSourceAnchor|
						copiedSourceAnchor := FmxSQLEntitySourceAnchor new
														entity: varColRef sourceAnchor entity;
														start: varColRef sourceAnchor start;
														end: varColRef sourceAnchor end;
														yourself.
						(tableCol createReferenceEntityFrom: varColRef source)
							isWildCardReference: varColRef isWildCardReference;
							sourceAnchor: copiedSourceAnchor;
							isCertain: false;
							mooseModel: newLocalVariable mooseModel ] ]
				ifNone: [ self error: 'Reference to non-existing column.' ] ] ] ]
]

{ #category : #private }
FmxSQLModelBuilder >> loadMetaData [
	metadata := (PgMetadata database: self databaseName connection: self connection) extractMetadata.
	^ metadata
]

{ #category : #'model building - linking entities' }
FmxSQLModelBuilder >> visitStoredProceduresFor: aMooseModel [
	metadata getFunctions
		do: [ :pgFunction | 
			| function visitor |
			function := pgToFamixEntities at: pgFunction.
			visitor := FmxSQLSymbolResolutionVisitor
				model: aMooseModel
				function: function
				errorReport: self errorReport.
			(pgFunction isStub or: [ pgFunction isSqlAggregateFunction or: [ function isStub ] ])
					ifFalse: [ 
						self errorReport
							catch: SRReferencesNotFound, SRReferencesInconsistencies , FmxEntityParsingError , MessageNotUnderstood , Warning , NotFound
							during: [ 
								[ pgFunction ast acceptVisitor: visitor ]
									on: PSQLParseError
									do: [ :e | 
										FmxEntityParsingError new
											entity: function;
											parseError: e;
											signal ] ] ] ] displayingProgress: 'Symbol resolution for stored procedures'
]

{ #category : #'model building - linking entities' }
FmxSQLModelBuilder >> visitViewsDefinitionsFor: aMooseModel [
	metadata getViews
		do: [ :pgView | 
			| visitor |
			visitor := FmxSQLSymbolResolutionVisitor
				model: aMooseModel
				view: (pgToFamixEntities at: pgView)
				errorReport: self errorReport.
			
			self errorReport
				catch: SRReferencesNotFound, SRReferencesInconsistencies , FmxEntityParsingError , Warning , NotFound
				during: [ 
					[ (pgToFamixEntities at: pgView)
						query: (pgView ast acceptVisitor: visitor) entity query
					] on: PSQLParseError
									do: [ :e | 
										FmxEntityParsingError new
											entity: (pgToFamixEntities at: pgView);
											parseError: e;
											signal ] ] ] displayingProgress: 'Symbol resolution for views'
]
