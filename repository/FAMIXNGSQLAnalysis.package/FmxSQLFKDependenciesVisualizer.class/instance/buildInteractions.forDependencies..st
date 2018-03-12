interacting
buildInteractions: aView forDependencies: aCollectionOfDependencies
	aView interaction
		highlightNeighbors: [ :table | 
			((Array with: table) , (aCollectionOfDependencies select: [ :dep | dep head = table and: [ dep tail isNotNil ] ] thenCollect: #tail)) ]
		color: Color green.
		
	aView interaction showEdge
		shape: (RTArrowedLine new
					color: Color green);
               connectToAll: [ :table | aCollectionOfDependencies select: [ :dep | dep head = table and: [ dep tail isNotNil ] ] thenCollect: #tail ].