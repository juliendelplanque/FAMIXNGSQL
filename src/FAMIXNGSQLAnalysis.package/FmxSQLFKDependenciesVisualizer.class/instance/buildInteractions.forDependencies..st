interacting
buildInteractions: aView forDependencies: aCollectionOfDependencies
	"aView interaction
		noInteractions."
	aView interaction
		highlightNeighbors: [ :table | 
			((Array with: table) , (aCollectionOfDependencies select: [ :dep | dep key = table and: [ dep value isNotNil ] ] thenCollect: #value)) ]
		color: Color green.
		
	aView interaction showEdge
		shape: (RTArrowedLine new
					color: Color green);
               connectToAll: [ :table | aCollectionOfDependencies select: [ :dep | dep key = table and: [ dep value isNotNil ] ] thenCollect: #value ].