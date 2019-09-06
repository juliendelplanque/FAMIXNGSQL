testing
buildModel
	"Build the model from the connection to a DB.
	 Create a skip exception if the test can not be run.
	 This test case can only be run if 'dvdrental' DB is accessible from the DBConnectionsManager."
	| dbConnectionManagerClass |
	
	dbConnectionManagerClass := Smalltalk at: #DBConnectionsManager ifAbsent: [ self skip ].
	^ (dbConnectionManagerClass current connectionNamed: 'dvdrental')
			resetModel;
			fmxSQLModel