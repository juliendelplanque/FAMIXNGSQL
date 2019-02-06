as yet unclassified
createFmxSQLAliasNamed: anAlias forCurrentEntity: aFmxSQLEntity
	| alias |
	alias := (self createEntity: FmxSQLAlias)
		parentBehaviouralEntity: self currentEntity;
		name: anAlias;
		mooseModel: model;
		yourself.
	self
		useCurrentEntity: alias
		during: [ self createReferenceTo: aFmxSQLEntity ].
	^ alias