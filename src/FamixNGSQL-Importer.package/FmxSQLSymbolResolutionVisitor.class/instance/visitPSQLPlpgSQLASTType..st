visiting
visitPSQLPlpgSQLASTType: aPSQLPlpgSQLASTType
	self flag: #TODO.	"consider size and dimensions"
	^ self visit: aPSQLPlpgSQLASTType identifier thenDo: [ :typeName | self findTypeNamed: typeName ]