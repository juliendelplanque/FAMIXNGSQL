parsing
testCopyTypeDeclaration
	| table columnType column |
	table := FmxSQLTable new
		name: 'unit';
		mooseModel: model;
		yourself.
	columnType := FmxSQLType new
		name: 'myType';
		mooseModel: model;
		yourself.
	column := FmxSQLColumn new
		columnsContainer: table;
		mooseModel: model;
		name: 'id';
		type: columnType;
		yourself.
	self
		parseAndVisitFunction:
			' DECLARE
      "unit_id_v"          "unit"."id"%TYPE;
BEGIN
END;'.
	self assert: function localVariables size equals: 1.
	self assert: function localVariables first name equals: 'unit_id_v'.
	self assert: function localVariables first type equals: columnType