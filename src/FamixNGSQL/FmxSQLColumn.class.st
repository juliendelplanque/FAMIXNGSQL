"
I represent a Column in the relational model.
"
Class {
	#name : #FmxSQLColumn,
	#superclass : #FmxSQLStructuralEntity,
	#traits : 'FmxSQLTColumn',
	#classTraits : 'FmxSQLTColumn classTrait',
	#instVars : [
		'#type => FMOne type: #FmxSQLType opposite: #columns',
		'#references => FMMany type: #FmxSQLColumnReference opposite: #column'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLColumn class >> annotation [

	<MSEClass: #Column super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #meta }
FmxSQLColumn class >> requirements [

	<generated>
	^ { FmxSQLDerivedTable. FmxSQLNewLocalVariable. FmxSQLOldLocalVariable. FmxSQLRecordLocalVariable. FmxSQLTable. FmxSQLView }
]

{ #category : #accessing }
FmxSQLColumn >> belongsTo [

	<generated>
	^ self columnsContainer

]

{ #category : #accessing }
FmxSQLColumn >> belongsTo: anObject [

	<generated>
	self columnsContainer: anObject

]

{ #category : #accessing }
FmxSQLColumn >> foreignKeyConstraintsReferencing [
	^ (self queryIncoming: FmxSQLColumnReference) select: [ :ref | ref from class = FmxSQLForeignKeyConstraint and: [ ref from referencedColumns includes: self ] ]
]

{ #category : #testing }
FmxSQLColumn >> hasPrimaryKey [
	"Returns true if a Primary Key constraint is applied on the column.
	 Note that the column might not be the only one concerned by the the PK.
	"
	^ (self queryIncoming: FmxSQLColumnReference) anySatisfy: [ :ref | ref from class = FmxSQLPrimaryKeyConstraint ]
]

{ #category : #testing }
FmxSQLColumn >> hasUniqueConstraint [
	"Returns true if a Unique constraint is applied on the column.
	 Note that the column might not be the only one concerned by the the PK.
	"
	^ (self queryIncoming: FmxSQLColumnReference) anySatisfy: [ :ref | ref from class = FmxSQLUniqueConstraint ]
]

{ #category : #testing }
FmxSQLColumn >> isColumn [

	<generated>
	^ true
]

{ #category : #accessing }
FmxSQLColumn >> primaryKey [
	^ (self queryIncoming: FmxSQLColumnReference)
		detect: [ :ref | ref from class = FmxSQLPrimaryKeyConstraint ]
		ifNone: [ self error: 'No primary key applied on this column.' ]
]

{ #category : #accessing }
FmxSQLColumn >> references [
	"Relation named: #references type: #FmxSQLColumnReference opposite: #column"

	<generated>
	^ references
]

{ #category : #accessing }
FmxSQLColumn >> references: anObject [

	<generated>
	references value: anObject

]

{ #category : #accessing }
FmxSQLColumn >> type [
	"Relation named: #type type: #FmxSQLType opposite: #columns"

	<generated>
	^ type
]

{ #category : #accessing }
FmxSQLColumn >> type: anObject [

	<generated>
	type := anObject

]
