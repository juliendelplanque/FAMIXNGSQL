Extension { #name : #MooseAbstractGroup }

{ #category : #'*FamixNGSQL-Extensions' }
MooseAbstractGroup >> allCheckConstraints [
	
	<navigation: 'All check constraints'>
	^self allWithType: FmxSQLCheckConstraint
]

{ #category : #'*FamixNGSQL-Extensions' }
MooseAbstractGroup >> allForeignKeyConstraints [
	
	<navigation: 'All foreign key constraints'>
	^self allWithType: FmxSQLForeignKeyConstraint
]

{ #category : #'*FamixNGSQL-Extensions' }
MooseAbstractGroup >> allPrimaryKeyConstraints [
	
	<navigation: 'All primary key constraints'>
	^self allWithType: FmxSQLPrimaryKeyConstraint
]

{ #category : #'*FamixNGSQL-Extensions' }
MooseAbstractGroup >> allStoredProcedures [
	
	<navigation: 'All stored procedures'>
	^self allWithType: FmxSQLStoredProcedure
]

{ #category : #'*FamixNGSQL-Extensions' }
MooseAbstractGroup >> allTables [
	
	<navigation: 'All tables'>
	^self allWithType: FmxSQLTable
]

{ #category : #'*FamixNGSQL-Extensions' }
MooseAbstractGroup >> allTriggerStoredProcedures [
	
	<navigation: 'All trigger stored procedures'>
	^self allWithType: FmxSQLTriggerStoredProcedure
]

{ #category : #'*FamixNGSQL-Extensions' }
MooseAbstractGroup >> allTriggers [
	
	<navigation: 'All triggers'>
	^self allWithType: FmxSQLTrigger
]

{ #category : #'*FamixNGSQL-Extensions' }
MooseAbstractGroup >> allUniqueConstraints [
	
	<navigation: 'All unique constraints'>
	^self allWithType: FmxSQLUniqueConstraint
]

{ #category : #'*FamixNGSQL-Extensions' }
MooseAbstractGroup >> allViews [
	
	<navigation: 'All views'>
	^self allWithType: FmxSQLView
]
