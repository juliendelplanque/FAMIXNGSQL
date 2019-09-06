meta-model regeneration
regenerateMetaModel
	<script>
	"Warning, all classes having methods referencing one of the class of the meta-model should be recompiled. Else you will get errors about obsolete classes."
	
	"1. Ensure that no more instances of the meta-model exist in the system."
	self inheritanceTopClassesNames do: [ :className |
		Smalltalk globals
			at: className
			ifPresent: [ :c | c allSubInstances do: [ :e | e becomeForward: nil ] ]
			ifAbsent: [ UIManager default inform: className , ' not present, could not make references become forward nil.' ] ].
	Smalltalk garbageCollect.
	
	"2. Re-generate the meta-model."
	self new
		generateWithoutCleaning