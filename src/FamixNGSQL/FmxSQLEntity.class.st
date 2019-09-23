Class {
	#name : #FmxSQLEntity,
	#superclass : #MooseEntity,
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLEntity class >> metamodel [

	<generated>
	^ (self class environment at: #FmxSQLMetamodelGenerator) metamodel
]

{ #category : #testing }
FmxSQLEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isAlias [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isAliasAccess [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isAnyBelongerSourced [
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isCheckConstraint [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isColumn [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isColumnReference [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isConstraint [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isEntitySourceAnchor [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isExceptClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isForeignKey [
	self deprecated: 'Use #isForeignKeyConstraint instead.' transformWith: '`@receiver isForeignKey' -> '`@receiver isForeignKeyConstraint'.
	^ self isForeignKeyConstraint
]

{ #category : #testing }
FmxSQLEntity >> isForeignKeyConstraint [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isFromClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isGroupByClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isHavingClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isIntersectClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isJoinClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isLimitClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isLocalVariableAccess [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isNotNullConstraint [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isOnConflictClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isOrderByClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isParameterAccess [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isPrimaryKey [
	self deprecated: 'Use #isPrimaryKeyConstraint instead.' transformWith: '`@receiver isPrimaryKey' -> '`@receiver isPrimaryKeyConstraint'.
	^ self isPrimaryKeyConstraint
]

{ #category : #testing }
FmxSQLEntity >> isPrimaryKeyConstraint [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isQueryContainer [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isReturningClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isSelectClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isSetClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isStoredProcedure [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isStoredProcedureCall [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isTriggerStoredProcedure [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isUnionClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isUniqueConstraint [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isUsingClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isValuesClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isView [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isWhereClause [

	<generated>
	^ false
]

{ #category : #testing }
FmxSQLEntity >> isWithClause [

	<generated>
	^ false
]
