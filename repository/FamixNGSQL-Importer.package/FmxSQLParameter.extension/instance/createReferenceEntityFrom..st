*FamixNGSQL-Importer
createReferenceEntityFrom: aFmxSQLEntity
	| parameterAccess |
	parameterAccess := FmxSQLParameterAccess new
		parameter: self;
		yourself.
	aFmxSQLEntity references add: parameterAccess.
	^ parameterAccess