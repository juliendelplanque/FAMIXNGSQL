"
I represent a FOREIGN KEY constraint as defined in SQL standard.
"
Class {
	#name : #FmxSQLForeignKeyConstraint,
	#superclass : #FmxSQLConstraint,
	#instVars : [
		'#outgoingForeignKeyColumnReferences => FMMany type: #FmxSQLColumnReference opposite: #foreignKeyConstraintSource'
	],
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLForeignKeyConstraint class >> annotation [

	<MSEClass: #ForeignKeyConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #accessing }
FmxSQLForeignKeyConstraint >> foreignKeyColumns [
	^ self outgoingColumnReferences collect: #column
]

{ #category : #testing }
FmxSQLForeignKeyConstraint >> isForeignKeyConstraint [

	<generated>
	^ true
]

{ #category : #printing }
FmxSQLForeignKeyConstraint >> mooseNameOn: aStream [
	aStream
		<< $".
	super mooseNameOn: aStream.
	aStream << '" FK ('.
	self foreignKeyColumns do: [ :c | aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') REFERENCES ';
		<< self referencedColumnsTable name;
		<< $(.
	self referencedColumns do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') #';
		<< self mooseID.
]

{ #category : #accessing }
FmxSQLForeignKeyConstraint >> outgoingForeignKeyColumnReferences [
	"Relation named: #outgoingForeignKeyColumnReferences type: #FmxSQLColumnReference opposite: #foreignKeyConstraintSource"

	<generated>
	^ outgoingForeignKeyColumnReferences
]

{ #category : #accessing }
FmxSQLForeignKeyConstraint >> outgoingForeignKeyColumnReferences: anObject [

	<generated>
	outgoingForeignKeyColumnReferences value: anObject

]

{ #category : #accessing }
FmxSQLForeignKeyConstraint >> referencedColumns [
	^ self outgoingForeignKeyColumnReferences collect: #column
]

{ #category : #accessing }
FmxSQLForeignKeyConstraint >> referencedColumnsTable [
	^ self outgoingForeignKeyColumnReferences anyOne column columnsContainer
]
