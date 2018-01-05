initialization
defineRelationsForQuery

	(query as: #TQuery property: #withQueries)
		-*
	(query as: #TQuery property: #withParentQuery).
	
	(query as: #TQuery property: #parentRewriteRule)
		*-<>
	(rewriteRule as: #TRewriteRule property: #queries).
