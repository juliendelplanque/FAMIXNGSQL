*FamixNGSQL-Extensions
isAnyBelongerSourced
	^ { FmxSQLView . FmxSQLStoredProcedure } anySatisfy: [ :any | self container isKindOf: any ]