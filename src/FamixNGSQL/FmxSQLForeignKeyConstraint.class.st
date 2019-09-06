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
	(self outgoingColumnReferences collect: #column) do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') REFERENCES ';
		<< self outgoingForeignKeyColumnReferences anyOne column columnsContainer name;
		<< $(.
	(self outgoingForeignKeyColumnReferences collect: #column) do: [ :c |
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
