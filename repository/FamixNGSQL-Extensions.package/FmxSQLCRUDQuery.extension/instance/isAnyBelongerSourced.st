*FamixNGSQL-Extensions
isAnyBelongerSourced
	^ ({ FmxSQLView . FmxSQLStoredProcedure } anySatisfy: [ :any | self container isKindOf: any ])
			or: [ (self derivedTableDefining ifNotNil: #isAnyBelongerSourced ifNil: [ false ])
				or: [ self container class = FmxSQLCursor and: [ { FmxSQLView . FmxSQLStoredProcedure } anySatisfy: [ :any | self container parentBehaviouralEntity isKindOf: any ] ] ] ]