baselines
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec
			package: #FAMIXNGSQLMetamodelGenerator;
			package: #FAMIXNGSQLModelBuilder with: [ spec requires: #('PostgreSQL' 'PgMetadata') ];
			package: #FAMIXNGSQLAnalysis;
			package: #'FAMIXNGSQLAnalysis-ConnectionsManager' with: [ spec requires: #('DBConnectionsManager') ].
			
		spec baseline: 'PostgreSQL' with: [ 
			spec
				repository: 'github://juliendelplanque/PostgreSQLParser/repository' ].
		spec baseline: 'PgMetadata' with: [ 
			spec
				repository: 'github://olivierauverlot/PgMetadata' ].
		spec baseline: 'DBConnectionsManager' with: [ 
			spec
				repository: 'github://juliendelplanque/DBConnectionsManager/repository' ]  ]
