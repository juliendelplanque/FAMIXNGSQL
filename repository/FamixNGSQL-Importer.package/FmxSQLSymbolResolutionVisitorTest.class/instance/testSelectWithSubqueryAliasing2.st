parsing
testSelectWithSubqueryAliasing2
	self createTable: 'support' withColumns: #('cle_personne' 'debut' 'cle' 'cle_personne').
	self createStoredProcedure: 'min'.
	self parseAndVisitView: 'SELECT premierssupports.cle_personne,
    premierssupports.min,
    support.cle AS clesupport
   FROM ( SELECT support_1.cle_personne,
            min(support_1.debut) AS min
           FROM support support_1) premierssupports,
    support
  WHERE ((support.cle_personne = premierssupports.cle_personne) AND (support.debut = premierssupports.min))'