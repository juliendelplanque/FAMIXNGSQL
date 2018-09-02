visiting
visitPSQLASTColumnDefinition: aPSQLASTColumnDefinition
	self flag: #TODO.	"ask for column definition representation in model"
	self visit: aPSQLASTColumnDefinition columnName.
	self visit: aPSQLASTColumnDefinition type