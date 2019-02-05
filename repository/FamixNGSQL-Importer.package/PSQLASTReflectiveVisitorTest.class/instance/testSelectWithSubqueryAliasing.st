parsing
testSelectWithSubqueryAliasing
	[ self parseAndVisitView: ' SELECT subquery.string,
    subquery.major,
    subquery.minor,
    subquery.revision
   FROM ( VALUES (''3.0.5''::text,3,0,5)) subquery(string, major, minor, revision)'
	] on: Halt do: [ self fail ]