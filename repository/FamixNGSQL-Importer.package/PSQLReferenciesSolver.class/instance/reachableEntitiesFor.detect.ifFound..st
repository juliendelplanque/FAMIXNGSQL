detect
reachableEntitiesFor: aScope detect: aBlockClosure ifFound: aBlockClosureAction
	"optimisation to avoid recreate collection"

	aScope reachableEntities
		detect: aBlockClosure
		ifFound: [ :f | ^ aBlockClosureAction value: f ]
		ifNone: [ "continue" ].
	NotFound signal