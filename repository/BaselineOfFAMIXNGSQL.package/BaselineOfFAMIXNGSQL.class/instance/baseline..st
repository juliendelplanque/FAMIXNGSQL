baselines
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			package: #FAMIXNGSQLMetamodelGeneratorOld;
			package: #'FAMIXNGSQLNamur';
			group: 'default' with: #('FAMIXNGSQLNamur');
			group: 'meta-builder' with: #(#FAMIXNGSQLMetamodelGeneratorOld) ]