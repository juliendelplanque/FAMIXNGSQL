baselines
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			package: #FAMIXNGSQLMetamodelGenerator;
			package: #FAMIXNGSQLModelBuilder with: [ spec requires: #('PostgreSQL' 'PgMetadata') ];
			package: #FAMIXNGSQLAnalysis.
			
		spec baseline: 'PostgreSQL' with: [ 
			spec
				repository: 'github://juliendelplanque/PostgreSQLParser/repository' ].
		spec baseline: 'PgMetadata' with: [ 
			spec
				repository: 'github://olivierauverlot/PgMetadata' ]  ]
