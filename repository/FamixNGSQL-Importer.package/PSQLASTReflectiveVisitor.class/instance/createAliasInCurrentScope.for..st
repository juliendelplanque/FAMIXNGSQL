alias
createAliasInCurrentScope: anAlias for: aFmxSQLEntityOrBlock
	| alias |
	alias := (self createEntity: FmxSQLAlias)
		clause: self currentEntity;
		name: anAlias;
		yourself.
	self
		useCurrentEntity: alias
		during: [ aFmxSQLEntityOrBlock isClosure
				ifTrue: [ aFmxSQLEntityOrBlock value ]
				ifFalse: [ self createReferenceTo: aFmxSQLEntityOrBlock ] ].
	^ alias