visiting
visitPSQLASTNumericConstant: aPSQLASTNumericConstant
	(aPSQLASTNumericConstant content asNumber )
	"Do nothing, we ignore the content of the constant, just check that it is a number"