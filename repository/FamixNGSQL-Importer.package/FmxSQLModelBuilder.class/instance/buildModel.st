model building
buildModel
	"Build an instance of MooseModel from the connection to the database and returns it."
	| mooseModel |
	mooseModel := MooseModel new
						name: self databaseName;
						metamodel: FmxSQLMetamodelGenerator metamodel;
						yourself.
	pgToFamixEntities := Dictionary new.
	self
		addSpecialTables: mooseModel;
		addSpecialFunctions: mooseModel;
		loadMetaData;
		createNamespacesIn: mooseModel;
		createTypesIn: mooseModel;
		createTablesIn: mooseModel;
		createConstraintsIn: mooseModel;
		createViewsIn: mooseModel;
		createStoredProceduresIn: mooseModel;
		createTriggerStoredProceduresIn: mooseModel;
		createTriggersIn: mooseModel.
	self errorReport ifNotEmpty: #inspect.
	pgToFamixEntities := nil.
	
	^ mooseModel