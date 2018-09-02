clearing
clear
	self addedScopes do: [ :aScope | self associatedSolver removeScope: aScope ]