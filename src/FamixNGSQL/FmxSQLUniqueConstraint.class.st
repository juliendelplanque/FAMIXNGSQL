"
I represent a UNIQUE constraint as defined in SQL standard.
"
Class {
	#name : #FmxSQLUniqueConstraint,
	#superclass : #FmxSQLConstraint,
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLUniqueConstraint class >> annotation [

	<MSEClass: #UniqueConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLUniqueConstraint >> isUniqueConstraint [

	<generated>
	^ true
]

{ #category : #printing }
FmxSQLUniqueConstraint >> mooseNameOn: aStream [
	aStream << $".
	super mooseNameOn: aStream.
	aStream << '" UNIQUE ('.
	(self outgoingColumnReferences collect: #column) do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') #';
		<< self mooseID.
]
