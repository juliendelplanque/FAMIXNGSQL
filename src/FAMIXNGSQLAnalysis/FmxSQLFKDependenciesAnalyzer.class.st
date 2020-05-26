"
Compute dependencies between tables of the FamixNGSQL model provided as parameter according to their foreign keys.

A table T is dependent of another table T' if T has at least one foreign key referencing a column of T'.

The results of the analysis is stored in #dependencies instance variable and consists in an collection of Associations T -> T' (i.e. table dependent -> table depending on).

Tables that depends on no other tables get an association with nil as value.
"
Class {
	#name : #FmxSQLFKDependenciesAnalyzer,
	#superclass : #FmxSQLAnalyzer,
	#instVars : [
		'dependencies'
	],
	#category : #FAMIXNGSQLAnalysis
}

{ #category : #analyzing }
FmxSQLFKDependenciesAnalyzer >> analyze [
	dependencies := (self mooseGroup allWithType: FmxSQLTable)
							inject: OrderedCollection new
							into: [ :collection :table |
								|fks tablesDependingOn|
								fks := table constraints select: [ :c | c class = FmxSQLForeignKeyConstraint ].
								tablesDependingOn := (fks collect: [ :fk | (fk referencedColumns collect: #columnsContainer) ]) flattened asSet.
								tablesDependingOn
									ifEmpty: [ collection add: table -> nil ]
									ifNotEmpty: [ 
										tablesDependingOn do: [ :t | collection add: table -> t ] ].
								collection ]
]

{ #category : #accessing }
FmxSQLFKDependenciesAnalyzer >> dependencies [
	^ dependencies
]

{ #category : #accessing }
FmxSQLFKDependenciesAnalyzer >> dependencies: anObject [
	dependencies := anObject
]
