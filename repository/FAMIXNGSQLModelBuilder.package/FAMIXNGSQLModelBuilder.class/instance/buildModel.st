model building
buildModel
	"Build an instance of MooseModel from the connection to the database and returns it."
	| mooseModel |
	mooseModel := MooseModel new
						name: self databaseName;
						yourself.
	self
		loadMetaData;
		createTypesIn: mooseModel;
		createTablesIn: mooseModel;
		createViewsIn: mooseModel;
		createStoredProceduresIn: mooseModel;
		createTriggersIn: mooseModel.
	^ mooseModel