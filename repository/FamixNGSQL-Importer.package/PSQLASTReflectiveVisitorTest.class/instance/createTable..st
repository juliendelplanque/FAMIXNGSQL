helpers
createTable: aTableName
	^ FmxSQLTable new
		name: aTableName;
		mooseModel: model;
		yourself