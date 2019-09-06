"
I represent a PRIMARY KEY constraint as defined in SQL standard.
"
Class {
	#name : #FmxSQLPrimaryKeyConstraint,
	#superclass : #FmxSQLConstraint,
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLPrimaryKeyConstraint class >> annotation [

	<MSEClass: #PrimaryKeyConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLPrimaryKeyConstraint >> isPrimaryKeyConstraint [

	<generated>
	^ true
]

{ #category : #printing }
FmxSQLPrimaryKeyConstraint >> mooseNameOn: aStream [
	aStream << $".
	super mooseNameOn: aStream.
	aStream << '" PK ('.
	(self outgoingColumnReferences collect: #column) do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') #';
		<< self mooseID.
]
