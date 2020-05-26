"
This smoke test test if the model built from dvdrental database is correct.
"
Class {
	#name : #FmxNGSQLImporterDVDRentalTest,
	#superclass : #TestCase,
	#category : 'FamixNGSQL-Importer-CrashTest'
}

{ #category : #accessing }
FmxNGSQLImporterDVDRentalTest class >> defaultTimeLimit [
	^ 10 seconds
]

{ #category : #testing }
FmxNGSQLImporterDVDRentalTest >> buildModel [
	"Build the model from the connection to a DB.
	 Create a skip exception if the test can not be run.
	 This test case can only be run if 'dvdrental' DB is accessible from the DBConnectionsManager."
	| dbConnectionManagerClass |
	
	dbConnectionManagerClass := Smalltalk at: #DBConnectionsManager ifAbsent: [ self skip ].
	^ (dbConnectionManagerClass current connectionNamed: 'dvdrental')
			resetModel;
			fmxSQLModel
]

{ #category : #helpers }
FmxNGSQLImporterDVDRentalTest >> tableNamed: aString in: aModel [
	^ (aModel allWithType: FmxSQLTable) detect: [ :t | t name = aString ]
]

{ #category : #tests }
FmxNGSQLImporterDVDRentalTest >> testEntitiesCount [
	| model |
	model := self buildModel.
	
	self assert: (model allWithType: FmxSQLTable) size equals: 15.
	
	"According to the documentation, there is 1 trigger.
	 If you look at the source code, there are 2 triggers with 2 different names:
	 last_updated and film_fulltext_trigger.
	 Since last_updated is created for 14 tables and film_fulltext_trigger is created for 1 table,
	 the total number of triggers in the model is 15."
	self assert: (model allWithType: FmxSQLTrigger) size equals: 15.
	
	self assert: (model allWithType: FmxSQLView) size equals: 7.
	
	"According to the documentation there are 8 functions.
	 However, this number does not take into account _group_concat function which is defined
	 to define group_concat aggregate."
	self assert: ((model allWithType: FmxSQLStoredProcedure) reject: #isStub) size equals: 9.
	
	"13 sequences but can not test right now since they are not in the model."
]

{ #category : #tests }
FmxNGSQLImporterDVDRentalTest >> testTablesCheckCount [
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_category' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'language' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_actor' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'inventory' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'rental' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'payment' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'staff' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'actor' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'customer' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'address' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'city' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'country' in: model) checkConstraints size equals: 0.
	
	self assert: (self tableNamed: 'store' in: model) checkConstraints size equals: 0.
]

{ #category : #tests }
FmxNGSQLImporterDVDRentalTest >> testTablesColumnsCount [
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) columns size equals: 3.
	
	self assert: (self tableNamed: 'film_category' in: model) columns size equals: 3.
	
	self assert: (self tableNamed: 'film' in: model) columns size equals: 13.
	
	self assert: (self tableNamed: 'language' in: model) columns size equals: 3.
	
	self assert: (self tableNamed: 'film_actor' in: model) columns size equals: 3.
	
	self assert: (self tableNamed: 'inventory' in: model) columns size equals: 4.
	
	self assert: (self tableNamed: 'rental' in: model) columns size equals: 7.
	
	self assert: (self tableNamed: 'payment' in: model) columns size equals: 6.
	
	self assert: (self tableNamed: 'staff' in: model) columns size equals: 11.
	
	self assert: (self tableNamed: 'actor' in: model) columns size equals: 4.
	
	self assert: (self tableNamed: 'customer' in: model) columns size equals: 10.
	
	self assert: (self tableNamed: 'address' in: model) columns size equals: 8.
	
	self assert: (self tableNamed: 'city' in: model) columns size equals: 4.
	
	self assert: (self tableNamed: 'country' in: model) columns size equals: 3.
	
	self assert: (self tableNamed: 'store' in: model) columns size equals: 4.
]

{ #category : #tests }
FmxNGSQLImporterDVDRentalTest >> testTablesFKCount [
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) foreignKeyConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_category' in: model) foreignKeyConstraints size equals: 2.
	
	self assert: (self tableNamed: 'film' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'language' in: model) foreignKeyConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_actor' in: model) foreignKeyConstraints size equals: 2.
	
	self assert: (self tableNamed: 'inventory' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'rental' in: model) foreignKeyConstraints size equals: 3.
	
	self assert: (self tableNamed: 'payment' in: model) foreignKeyConstraints size equals: 3.
	
	self assert: (self tableNamed: 'staff' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'actor' in: model) foreignKeyConstraints size equals: 0.
	
	self assert: (self tableNamed: 'customer' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'address' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'city' in: model) foreignKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'country' in: model) foreignKeyConstraints size equals: 0.
	
	self assert: (self tableNamed: 'store' in: model) foreignKeyConstraints size equals: 2.
]

{ #category : #tests }
FmxNGSQLImporterDVDRentalTest >> testTablesNotNullCount [
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) notNullConstraints size equals: 3.
	
	self assert: (self tableNamed: 'film_category' in: model) notNullConstraints size equals: 3.
	
	self assert: (self tableNamed: 'film' in: model) notNullConstraints size equals: 8.
	
	self assert: (self tableNamed: 'language' in: model) notNullConstraints size equals: 3.
	
	self assert: (self tableNamed: 'film_actor' in: model) notNullConstraints size equals: 3.
	
	self assert: (self tableNamed: 'inventory' in: model) notNullConstraints size equals: 4.
	
	self assert: (self tableNamed: 'rental' in: model) notNullConstraints size equals: 6.
	
	self assert: (self tableNamed: 'payment' in: model) notNullConstraints size equals: 6.
	
	self assert: (self tableNamed: 'staff' in: model) notNullConstraints size equals: 8.
	
	self assert: (self tableNamed: 'actor' in: model) notNullConstraints size equals: 4.
	
	self assert: (self tableNamed: 'customer' in: model) notNullConstraints size equals: 7.
	
	self assert: (self tableNamed: 'address' in: model) notNullConstraints size equals: 6.
	
	self assert: (self tableNamed: 'city' in: model) notNullConstraints size equals: 4.
	
	self assert: (self tableNamed: 'country' in: model) notNullConstraints size equals: 3.
	
	self assert: (self tableNamed: 'store' in: model) notNullConstraints size equals: 4.
]

{ #category : #tests }
FmxNGSQLImporterDVDRentalTest >> testTablesPKCount [
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'film_category' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'film' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'language' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'film_actor' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'inventory' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'rental' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'payment' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'staff' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'actor' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'customer' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'address' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'city' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'country' in: model) primaryKeyConstraints size equals: 1.
	
	self assert: (self tableNamed: 'store' in: model) primaryKeyConstraints size equals: 1.
]

{ #category : #tests }
FmxNGSQLImporterDVDRentalTest >> testTablesUniqueCount [
	| model |
	model := self buildModel.
	
	self assert: (self tableNamed: 'category' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_category' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'language' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'film_actor' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'inventory' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'rental' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'payment' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'staff' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'actor' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'customer' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'address' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'city' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'country' in: model) uniqueConstraints size equals: 0.
	
	self assert: (self tableNamed: 'store' in: model) uniqueConstraints size equals: 0.
]
