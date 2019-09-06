helpers
createColumn: aName inTable: aFmxSQLTable
	^ FmxSQLColumn new
		columnsContainer: aFmxSQLTable;
		name: aName;
		mooseModel: model;
		yourself