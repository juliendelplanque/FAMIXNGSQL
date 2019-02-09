model building - linking entities
visitViewsDefinitionsFor: aMooseModel
	metadata getViews
		do: [ :pgView | 
			| visitor |
			visitor := PSQLASTReflectiveVisitor
				model: aMooseModel
				view: (pgToFamixEntities at: pgView)
				errorReport: self errorReport.
			
			self errorReport
				catch: SRReferencesNotFound, SRReferencesInconsistencies , FmxEntityParsingError , Warning
				during: [ 
					[ (pgToFamixEntities at: pgView)
						query: (pgView ast acceptVisitor: visitor) entity query
					] on: PSQLParseError
									do: [ :e | 
										FmxEntityParsingError new
											entity: (pgToFamixEntities at: pgView);
											parseError: e;
											signal ] ] ]