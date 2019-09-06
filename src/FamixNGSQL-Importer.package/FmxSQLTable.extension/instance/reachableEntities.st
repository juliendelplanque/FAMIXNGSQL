*FamixNGSQL-Importer
reachableEntities
	^ self columns , ((self queryIncoming: FmxSQLAliasAccess) collect: [ :access | access from ])