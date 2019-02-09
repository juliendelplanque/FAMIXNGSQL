model building - linking entities
visitStoredProceduresFor: aMooseModel
	metadata getFunctions
		do: [ :pgFunction | 
			| function visitor |
			function := pgToFamixEntities at: pgFunction.
			visitor := FmxSQLSymbolResolutionVisitor
				model: aMooseModel
				function: function
				errorReport: self errorReport.
			(pgFunction isStub or: [ pgFunction isSqlAggregateFunction or: [ function isStub ] ])
					ifFalse: [ 
						self errorReport
							catch: SRReferencesNotFound, SRReferencesInconsistencies , FmxEntityParsingError , MessageNotUnderstood , Warning
							during: [ 
								[ pgFunction ast acceptVisitor: visitor ]
									on: PSQLParseError
									do: [ :e | 
										FmxEntityParsingError new
											entity: function;
											parseError: e;
											signal ] ] ] ]