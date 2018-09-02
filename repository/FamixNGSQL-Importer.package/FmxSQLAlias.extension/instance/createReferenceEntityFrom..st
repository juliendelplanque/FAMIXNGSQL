*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| aliasAccess |
	aliasAccess := FmxSQLAliasAccess new
		alias: self;
		yourself.
	aFmxSQLEntity references add: aliasAccess.
	^ aliasAccess