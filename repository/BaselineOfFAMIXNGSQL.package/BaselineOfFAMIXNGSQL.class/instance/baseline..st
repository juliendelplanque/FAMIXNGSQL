baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				package: #FAMIXNGSQLMetamodelGenerator;
				package: #FAMIXNGSQLModelBuilder with: [ spec requires: #('PostgreSQLParser' 'PgMetadata') ];
				package: #'FamixNGSQL-Importer' with: [ spec requires: #('FAMIXNGSQLModelBuilder' 'PostgreSQLParser') ];
				package: #FAMIXNGSQLAnalysis;
				package: #FamixNGSQL;
				package: #'FAMIXNGSQLAnalysis-ConnectionsManager' with: [ spec requires: #('DBConnectionsManager') ].
			spec baseline: 'PostgreSQLParser' with: [ spec repository: 'github://juliendelplanque/PostgreSQLParser/src' ].
			spec baseline: 'PgMetadata' with: [ spec repository: 'github://olivierauverlot/PgMetadata' ].
			spec
				baseline: 'DBConnectionsManager'
				with: [ spec
						repository: 'github://juliendelplanque/DBConnectionsManager/repository';
						loads: 'pgmetadata' ] ]