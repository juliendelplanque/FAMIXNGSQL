alias
createAliasInCurrentScope: anAlias for: aFmxSQLEntityOrBlock
	| alias |
	alias := (self createEntity: FmxSQLAlias)
		parentBehaviouralEntity: self currentEntity;
		name: anAlias;
		yourself.
	self
		useCurrentEntity: alias
		during: [ aFmxSQLEntityOrBlock isClosure
				ifTrue: [ aFmxSQLEntityOrBlock value ]
				ifFalse: [ self createReferenceTo: aFmxSQLEntityOrBlock ] ].
	^ alias