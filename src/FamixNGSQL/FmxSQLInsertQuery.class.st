"
I am an INSERT query.
"
Class {
	#name : #FmxSQLInsertQuery,
	#superclass : #FmxSQLCRUDQuery,
	#traits : 'FmxSQLTDefiningDerivedTables',
	#classTraits : 'FmxSQLTDefiningDerivedTables classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLInsertQuery class >> annotation [

	<MSEClass: #InsertQuery super: #FmxSQLCRUDQuery>
	<package: #FamixNGSQL>
	<generated>
	^self
]
