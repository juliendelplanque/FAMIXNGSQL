as yet unclassified
beDefinedUsing: anObject
	anObject createFmxSQLAliasNamed: self alias forCurrentEntity: self entity.
	^ anObject defineAliasInCurrentScope: self alias for: self entity.