"
I am an DELETE query.
"
Class {
	#name : #FmxSQLDeleteQuery,
	#superclass : #FmxSQLCRUDQuery,
	#traits : 'FmxSQLTDefiningDerivedTables',
	#classTraits : 'FmxSQLTDefiningDerivedTables classTrait',
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLDeleteQuery class >> annotation [

	<MSEClass: #DeleteQuery super: #FmxSQLCRUDQuery>
	<package: #FamixNGSQL>
	<generated>
	^self
]
