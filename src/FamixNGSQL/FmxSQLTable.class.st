"
I represent a Table in the relational model.
"
Class {
	#name : #FmxSQLTable,
	#superclass : #FmxSQLStructuralEntity,
	#traits : 'FmxSQLAbstractType + FmxSQLColumnsContainer',
	#classTraits : 'FmxSQLAbstractType classTrait + FmxSQLColumnsContainer classTrait',
	#instVars : [
		'#constraints => FMMany type: #FmxSQLConstraint opposite: #table',
		'#superTable => FMOne type: #FmxSQLTable opposite: #subTables',
		'#subTables => FMMany type: #FmxSQLTable opposite: #superTable',
		'#references => FMMany type: #FmxSQLTableReference opposite: #table',
		'#triggers => FMMany type: #FmxSQLTrigger opposite: #table',
		'#updateQueries => FMMany type: #FmxSQLUpdateQuery opposite: #table'
	],
	#category : #'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLTable class >> annotation [

	<MSEClass: #Table super: #FmxSQLStructuralEntity>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #adding }
FmxSQLTable >> addConstraints: anObject [
	<generated>
	^ self constraints add: anObject
]

{ #category : #adding }
FmxSQLTable >> addTriggers: anObject [
	<generated>
	^ self triggers add: anObject
]

{ #category : #accessing }
FmxSQLTable >> checkConstraints [
	^ self constraintsSatisfying: [ :c | c class = FmxSQLCheckConstraint ]
]

{ #category : #accessing }
FmxSQLTable >> columnsWithUniqueConstraint [
	^ ((self constraintsSatisfying: [ :c | c isUniqueConstraint ])
			flatCollect: [ :c | (c queryOutgoing: FmxSQLColumnReference) collect: #column ]) asSet asArray
]

{ #category : #accessing }
FmxSQLTable >> conceptId [
	^ self conceptIdIfAbsent: [ self error: 'Table has no concept.' ]
]

{ #category : #accessing }
FmxSQLTable >> conceptIdIfAbsent: aBlock [
	^ self privateState attributeAt: #concept ifAbsent: aBlock
]

{ #category : #accessing }
FmxSQLTable >> constraints [
	"Relation named: #constraints type: #FmxSQLConstraint opposite: #table"

	<generated>
	^ constraints
]

{ #category : #accessing }
FmxSQLTable >> constraints: anObject [

	<generated>
	constraints value: anObject

]

{ #category : #navigation }
FmxSQLTable >> constraintsGroup [
	<generated>
	<navigation: 'Constraints'>
	^ MooseGroup withAll: self constraints asSet
]

{ #category : #accessing }
FmxSQLTable >> constraintsSatisfying: aBlock [
	^ self constraints select: aBlock
]

{ #category : #accessing }
FmxSQLTable >> exclusionConstraints [
	^ self constraintsSatisfying: [ :c | c class = FmxSQLExclusionConstraint ]
]

{ #category : #accessing }
FmxSQLTable >> foreignKeyConstraints [
	^ self constraintsSatisfying: [ :c | c class = FmxSQLForeignKeyConstraint ]
]

{ #category : #testing }
FmxSQLTable >> hasSuperTable [
	^ self superTable isNotNil
]

{ #category : #accessing }
FmxSQLTable >> incomingForeignKeyConstraints [
	^ ((self columns
		select: [ :c | c hasUniqueConstraint or: [ c hasPrimaryKey ] ])
		flatCollect: [ :c | c foreignKeyConstraintsReferencing collect: #from ]) asSet asArray
]

{ #category : #accessing }
FmxSQLTable >> notNullConstraints [
	^ self constraintsSatisfying: [ :c | c class = FmxSQLNotNullConstraint ]
]

{ #category : #accessing }
FmxSQLTable >> primaryKeyConstraints [
	^ self constraintsSatisfying: [ :c | c class = FmxSQLPrimaryKeyConstraint ]
]

{ #category : #accessing }
FmxSQLTable >> references [
	"Relation named: #references type: #FmxSQLTableReference opposite: #table"

	<generated>
	^ references
]

{ #category : #accessing }
FmxSQLTable >> references: anObject [

	<generated>
	references value: anObject

]

{ #category : #accessing }
FmxSQLTable >> subTables [
	"Relation named: #subTables type: #FmxSQLTable opposite: #superTable"

	<generated>
	^ subTables
]

{ #category : #accessing }
FmxSQLTable >> subTables: anObject [

	<generated>
	subTables value: anObject

]

{ #category : #accessing }
FmxSQLTable >> superTable [
	"Relation named: #superTable type: #FmxSQLTable opposite: #subTables"

	<generated>
	^ superTable
]

{ #category : #accessing }
FmxSQLTable >> superTable: anObject [

	<generated>
	superTable := anObject

]

{ #category : #accessing }
FmxSQLTable >> triggers [
	"Relation named: #triggers type: #FmxSQLTrigger opposite: #table"

	<generated>
	^ triggers
]

{ #category : #accessing }
FmxSQLTable >> triggers: anObject [

	<generated>
	triggers value: anObject

]

{ #category : #navigation }
FmxSQLTable >> triggersGroup [
	<generated>
	<navigation: 'Triggers'>
	^ MooseGroup withAll: self triggers asSet
]

{ #category : #accessing }
FmxSQLTable >> uniqueConstraints [
	^ self constraintsSatisfying: [ :c | c class = FmxSQLUniqueConstraint ]
]

{ #category : #accessing }
FmxSQLTable >> updateQueries [
	"Relation named: #updateQueries type: #FmxSQLUpdateQuery opposite: #table"

	<generated>
	^ updateQueries
]

{ #category : #accessing }
FmxSQLTable >> updateQueries: anObject [

	<generated>
	updateQueries value: anObject

]
