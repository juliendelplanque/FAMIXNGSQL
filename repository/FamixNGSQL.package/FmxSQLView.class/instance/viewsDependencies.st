accessing
viewsDependencies
	"Returns the views that I depend on directly (I reference them directly)."
	^ ((self queryOutgoing: FmxSQLViewReference) collect: [ :ref | ref to ]) asSet