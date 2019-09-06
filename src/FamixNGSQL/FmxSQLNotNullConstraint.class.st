"
I represent a NOT NULL constraint as defined in SQL standard.
"
Class {
	#name : #FmxSQLNotNullConstraint,
	#superclass : #FmxSQLConstraint,
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLNotNullConstraint class >> annotation [

	<MSEClass: #NotNullConstraint super: #FmxSQLConstraint>
	<package: #FamixNGSQL>
	<generated>
	^self
]

{ #category : #testing }
FmxSQLNotNullConstraint >> isNotNullConstraint [

	<generated>
	^ true
]

{ #category : #printing }
FmxSQLNotNullConstraint >> mooseNameOn: aStream [
	aStream << 'NOT NULL ('.
	(self outgoingColumnReferences collect: #column) do: [ :c |
		aStream << c name ] separatedBy: [ aStream << ', ' ].
	aStream
		<< ') #';
		<< self mooseID.
]
