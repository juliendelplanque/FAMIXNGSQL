visiting
visitPSQLASTValuesCommand: aPSQLASTValuesCommand
	self visitAll: aPSQLASTValuesCommand values.
	^ PSQLASTValuesNullObject new
		mooseModel: model;
		yourself