convenient linking
createReferenceTo: anEntity
	^ (anEntity value createReferenceEntityFrom: self currentEntity)
		mooseModel: self model;
		yourself