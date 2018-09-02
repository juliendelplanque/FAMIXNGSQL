parsing
testSelectWithJoinAndAliasing
	self createTable: #initiative withColumns: #(id issue_id).
	self createTable: #battle withColumns: #(losing_iniative_id).
	self
		parseAndVisitFunction:
			'DECLARE
BEGIN
	SELECT "new_initiative"."id" AS "initiative_id"
		FROM "initiative" "old_initiative"
		JOIN "initiative" "new_initiative"
			ON "new_initiative"."issue_id" = 10
		JOIN "battle" "battle_win"
			ON "battle_win"."losing_initiative_id" = "old_initiative"."id";
END;'.
	