as yet unclassified
createFmxSQLAliasNamed: anAlias forCurrentEntity: aFmxSQLEntity
	| alias |
	alias := (self createEntity: aFmxSQLEntity aliasClass)
		parentBehaviouralEntity: self currentEntity;
		name: anAlias;
		mooseModel: model;
		yourself.
	self
		useCurrentEntity: alias
		during: [ self createReferenceTo: aFmxSQLEntity ].
	^ alias