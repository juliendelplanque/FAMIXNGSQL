as yet unclassified
createFmxSQLColumnAliasNamed: aString forDerivedTable: aFmxSQLDerivedTable
	| alias |
	alias := (self createEntity: FmxSQLColumnAlias)
		parentBehaviouralEntity: self currentEntity;
		name: aString;
		mooseModel: model;
		yourself.
	self
		useCurrentEntity: alias
		during: [ self createReferenceTo: aFmxSQLDerivedTable ].
	^ alias