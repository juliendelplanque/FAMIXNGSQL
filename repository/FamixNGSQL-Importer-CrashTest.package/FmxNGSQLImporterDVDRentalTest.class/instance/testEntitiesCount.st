tests
testEntitiesCount
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