model building - linking entities
linkColumnReferencesToNewAndOldLocalVariableFor: model
	(model allWithType: FmxSQLNewLocalVariable) , (model allWithType: FmxSQLOldLocalVariable) do: [ :newLocalVariable |
		newLocalVariable columns do: [ :varCol |
		(newLocalVariable parentBehaviouralEntity triggers collect: #table) do: [ :table |
			table columns
				detect: [ :tableCol | tableCol name = varCol name ]
				ifFound: [ :tableCol |
					varCol references do: [ :varColRef |
						(tableCol createReferenceEntityFrom: varColRef source)
							isWildCardReference: varColRef isWildCardReference;
							sourceAnchor: varColRef sourceAnchor copy;
							isCertain: false;
							mooseModel: newLocalVariable mooseModel ] ]
				ifNone: [ self error: 'Reference to non-existing column.' ] ] ] ]