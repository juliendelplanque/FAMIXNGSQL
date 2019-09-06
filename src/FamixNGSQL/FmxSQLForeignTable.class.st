"
I am a foreign table, that is to say, my data source is not inside the database.
"
Class {
	#name : #FmxSQLForeignTable,
	#superclass : #FmxSQLTable,
	#category : 'FamixNGSQL-Entities'
}

{ #category : #meta }
FmxSQLForeignTable class >> annotation [

	<MSEClass: #ForeignTable super: #FmxSQLTable>
	<package: #FamixNGSQL>
	<generated>
	^self
]
