helpers
regenerateFAMIXNGSQLMetaModel
	<script>
	"1. Ensure that no more instances of the meta-model exist in the system."
	FamixNGSQLEntity allSubInstances do: [ :e | e becomeForward: nil ].
	Smalltalk garbageCollect.
	
	"2. Reset stateful traits."
	StatefulTraitsManager uniqueInstance cleanAll.
	StatefulTraitsManager reset.
	
	"3. Re-generate the meta-model."
	FAMIXNGSQLMetamodelGenerator new
		cleanPackage;
		generate