model building - linking entities
visitStoredProceduresFor: aMooseModel
	metadata getFunctions
		do: [ :pgFunction | 
			| function visitor |
			function := pgToFamixEntities at: pgFunction.
			visitor := PSQLASTReflectiveVisitor
				model: aMooseModel
				function: function
				errorReport: self errorReport.
			(pgFunction isStub or: [ pgFunction isSqlAggregateFunction ])
					ifFalse: [ 
						self errorReport
							catch: SRReferencesNotFound, SRReferencesInconsistencies , PSQLParseError , Warning
							during: [ pgFunction ast acceptVisitor: visitor ] ] ]