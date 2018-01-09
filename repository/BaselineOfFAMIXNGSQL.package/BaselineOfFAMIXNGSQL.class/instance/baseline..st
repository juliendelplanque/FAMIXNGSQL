baselines
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			package: #'FAMIXNGSQLMetamodelGenerator';
			package: #'FAMIXNGSQLNamur';
			group: 'default' with: #('FAMIXNGSQLNamur');
			group: 'meta-builder' with: #('FAMIXNGSQLMetamodelGenerator') ]