Extension { #name : #MooseAbstractGroup }

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
MooseAbstractGroup >> allCheckConstraints [
	
	<navigation: 'All check constraints'>
	^self allWithType: FmxSQLCheckConstraint
]

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
MooseAbstractGroup >> allForeignKeyConstraints [
	
	<navigation: 'All foreign key constraints'>
	^self allWithType: FmxSQLForeignKeyConstraint
]

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
MooseAbstractGroup >> allPrimaryKeyConstraints [
	
	<navigation: 'All primary key constraints'>
	^self allWithType: FmxSQLPrimaryKeyConstraint
]

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
MooseAbstractGroup >> allStoredProcedures [
	
	<navigation: 'All stored procedures'>
	^self allWithType: FmxSQLStoredProcedure
]

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
MooseAbstractGroup >> allTables [
	
	<navigation: 'All tables'>
	^self allWithType: FmxSQLTable
]

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
MooseAbstractGroup >> allTriggerStoredProcedures [
	
	<navigation: 'All trigger stored procedures'>
	^self allWithType: FmxSQLTriggerStoredProcedure
]

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
MooseAbstractGroup >> allTriggers [
	
	<navigation: 'All triggers'>
	^self allWithType: FmxSQLTrigger
]

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
MooseAbstractGroup >> allUniqueConstraints [
	
	<navigation: 'All unique constraints'>
	^self allWithType: FmxSQLUniqueConstraint
]

{ #category : #'*FamixNGSQL-GTInspectorExtension' }
MooseAbstractGroup >> allViews [
	
	<navigation: 'All views'>
	^self allWithType: FmxSQLView
]
