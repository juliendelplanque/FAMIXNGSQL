children
childrenFor: aNode
	^ aNode class allInstVarNames
		flatCollect: [ :instanceVar | 
			(aNode perform: instanceVar)
				in: [ :varContent | 
					varContent isPSQLASTNode
						ifFalse: [ (varContent isString not and: [ varContent isCollection ])
								ifTrue: [ varContent ]
								ifFalse: [ {} ] ]
						ifTrue: [ varContent asCollection ] ] ]