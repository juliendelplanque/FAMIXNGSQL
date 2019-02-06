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
				catch: SRReferencesNotFound, SRReferencesInconsistencies , PSQLParseError , Warning
				during: [ 
					(pgToFamixEntities at: pgView)
						query: (pgView ast acceptVisitor: visitor) entity query ] ]