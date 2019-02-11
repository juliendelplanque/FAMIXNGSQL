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
		createForeignTablesIn: mooseModel;
		createConstraintsIn: mooseModel;
		createViewsIn: mooseModel;
		createStoredProceduresIn: mooseModel;
		createTriggerStoredProceduresIn: mooseModel;
		createTriggersIn: mooseModel.
	"Need to do it in 2 steps because views can reference each others."
	self
		visitViewsDefinitionsFor: mooseModel;
		visitStoredProceduresFor: mooseModel.
	mooseModel
		errorReport: self errorReport.
	pgToFamixEntities := nil.
	
	^ mooseModel