entity creation
createEntity: anEntityClass 
	^ anEntityClass new
		mooseModel: self model;
		yourself