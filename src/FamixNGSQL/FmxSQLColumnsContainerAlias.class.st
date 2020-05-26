"
I am an alias for a table. Eventually I also contain alias to columns.
"
Class {
	#name : #FmxSQLColumnsContainerAlias,
	#superclass : #FmxSQLAlias,
	#traits : 'FmxSQLTWithTableReference + FmxSQLTWithViewReference',
	#classTraits : 'FmxSQLTWithTableReference classTrait + FmxSQLTWithViewReference classTrait',
	#instVars : [
		'#columnAliases => FMMany type: #FmxSQLColumnAlias opposite: #columnsContainerAlias'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLColumnsContainerAlias class >> annotation [

	<MSEClass: #ColumnsContainerAlias super: #FmxSQLAlias>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLColumnsContainerAlias >> columnAliases [
	"Relation named: #columnAliases type: #FmxSQLColumnAlias opposite: #columnsContainerAlias"

	<generated>
	^ columnAliases
]

{ #category : #accessing }
FmxSQLColumnsContainerAlias >> columnAliases: anObject [

	<generated>
	columnAliases value: anObject

]
