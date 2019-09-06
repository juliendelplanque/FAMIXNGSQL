"
I am an alias for a column.
"
Class {
	#name : #FmxSQLColumnAlias,
	#superclass : #FmxSQLAlias,
	#traits : 'FmxSQLTColumn + FmxSQLTWithColumnReference + FmxSQLTWithReferencesGroupReference',
	#classTraits : 'FmxSQLTColumn classTrait + FmxSQLTWithColumnReference classTrait + FmxSQLTWithReferencesGroupReference classTrait',
	#instVars : [
		'#columnsContainerAlias => FMOne type: #FmxSQLColumnsContainerAlias opposite: #columnAliases'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLColumnAlias class >> annotation [

	<MSEClass: #ColumnAlias super: #FmxSQLAlias>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLColumnAlias class >> requirements [

	<generated>
	^ { FmxSQLDerivedTable. FmxSQLNewLocalVariable. FmxSQLOldLocalVariable. FmxSQLRecordLocalVariable. FmxSQLTable. FmxSQLView }
]

{ #category : #accessing }
FmxSQLColumnAlias >> belongsTo [

	<generated>
	^ self columnsContainer

]

{ #category : #accessing }
FmxSQLColumnAlias >> belongsTo: anObject [

	<generated>
	self columnsContainer: anObject

]

{ #category : #accessing }
FmxSQLColumnAlias >> columnsContainerAlias [
	"Relation named: #columnsContainerAlias type: #FmxSQLColumnsContainerAlias opposite: #columnAliases"

	<generated>
	^ columnsContainerAlias
]

{ #category : #accessing }
FmxSQLColumnAlias >> columnsContainerAlias: anObject [

	<generated>
	columnsContainerAlias := anObject

]
