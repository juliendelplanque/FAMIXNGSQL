*FamixNGSQL-Extensions
viewsDepending
	"Returns the views that depends on myself directly (reference myself directly)."
	^ ((self queryLocalIncoming: FmxSQLViewReference) collect: [ :ref | ref source sourcedBelonger ] thenSelect: [ :sourcedBelonger | sourcedBelonger isNotNil and: [ sourcedBelonger isView ] ]) asSet