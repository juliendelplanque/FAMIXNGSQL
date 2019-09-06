Class {
	#name : #FamixNGSQLNamurStoredProcedure,
	#superclass : #FamixNGSQLNamurCodeFragment,
	#category : 'FamixNGSQLNamur'
}

{ #category : #meta }
FamixNGSQLNamurStoredProcedure class >> annotation [

	<MSEClass: #StoredProcedure super: #FamixNGSQLNamurCodeFragment>
	<package: #FamixNGSQLNamur>
	^self
]

{ #category : #meta }
FamixNGSQLNamurStoredProcedure class >> statefulTraits [

	<statefulTraits>
	^ {FamixNGSQLNamurTStoredProcedureCall}
]
