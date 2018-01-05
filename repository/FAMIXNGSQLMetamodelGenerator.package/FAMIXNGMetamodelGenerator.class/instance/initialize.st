initialization
initialize

	super initialize.
	
	builder := FamixMetamodelBuilder new.
	builder 
		prefix: 'FamixNGSQL';
		packageName: 'FamixNGSQL'.
	