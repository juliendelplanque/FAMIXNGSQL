model building - linking entities
visitViewsDefinitionsFor: aMooseModel
	metadata getViews
		do: [ :pgView | 
			| visitor |
			visitor := PSQLASTReflectiveVisitor
				model: aMooseModel
				view: (pgToFamixEntities at: pgView)
				errorReport: self errorReport.
			pgView ast
				in: [ :ast | 
					ast isPetitFailure
						ifTrue: [ "ast inspect; halt." self errorReport addError: ast ]
						ifFalse: [ (pgToFamixEntities at: pgView)
								query: (ast acceptVisitor: visitor) entity query ] ] ]