testing
dependsOn: aFmxSQLView
	^ TreeQuery breadthFirst matchAnywhere
		predicate: self asTQPredicate;
		runOn: aFmxSQLView childrenBlock: #viewsDepending