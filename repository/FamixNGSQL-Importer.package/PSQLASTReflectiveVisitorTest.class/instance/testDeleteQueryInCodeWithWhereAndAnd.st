parsing
testDeleteQueryInCodeWithWhereAndAnd
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
		yourself..
	self
		parseAndVisitFunction:
			' DECLARE
BEGIN
	DELETE FROM "direct_population_snapshot"
        WHERE "issue_id" = "issue_id_p"
        AND "event" = ''periodic'';
END;'.
	"self assert: function clauses size equals: 1"